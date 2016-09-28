var Hapi = require('hapi');
const Basic = require('hapi-auth-basic');
var requireDir = require('require-dir');
var config = require('./config');
var routes = requireDir('./controllers');
var users = require('./repositories/user');


const server = new Hapi.Server();

server.connection({
    host: config.host,
    port: config.port
});

const validate = function (request, username, password, callback) {
    users.findByEmail(username)
        .catch(function (err) {
            console.log(err);
        })
        .then(function (user) {
            if (user.length <= 0) {
                return callback(null, false);
            }

            if (password == user[0].DS_PASSWORD) {
                callback(null, true, {
                    id: user[0].id,
                    name: user[0].name
                });
            }else {
                return callback(null, false);
            };

        });
};

server.register(Basic, (err) => {
    if (err) {
        console.error(err);
    }
    server.auth.strategy('simple', 'basic', {
        validateFunc: validate
    });

    for (let route in routes) {
        if (routes[route].length > 0) {
            server.route(routes[route]);
        }
    }

});

server.register({
	register: require('hapi-cors'),
	options: {
		origins: ['*']
	}
});

server.start((err) => {
    if (err) {
        throw err;
    }
    console.log('Server running at:', server.info.uri);
});

module.exports = server;