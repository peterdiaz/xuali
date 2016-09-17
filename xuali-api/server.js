'use strict';

var Hapi = require('hapi'),
    Pack = require('./package'),
    requireDir = require('require-dir'),
    HapiSwagger = require('hapi-swagger'),
    Inert = require('inert'),
    Vision = require('vision'),
    environment = process.env.NODE_ENV,
    Config = require('./config');

const Path = require('path');

// Create a server with a host and port
const server = new Hapi.Server({
    connections: {
        routes: {
            files: {
                relativeTo: Path.join(__dirname, '/')
            }
        }
    }
});

server.connection({
    port: Config.port
});

//Routes
var routes = requireDir('./app/controllers');

for (var route in routes) {
    server.route(routes[route]);
}

//Event logger
var goodOptions = {
    reporters: {
        file: [{
            module: 'good-squeeze',
            name: 'Squeeze',
            args: [{
                error: '*'
            }]
        }, {
            module: 'good-squeeze',
            name: 'SafeJson'
        }, {
            module: 'rotating-file-stream',
            args: [
                'errors_log.json', {
                    interval: '1d',
                    path: './logs'
                }
            ]
        }]
    }
};

//Api documentation
var swaggerOptions = {
    info: {
        title: 'Xuali API Documentation',
        version: Pack.version,
        description: 'This API was built to provide data to Xuali App'
    }
};
//Registering Plugins
server.register([
    Inert,
    Vision, {
        register: HapiSwagger,
        options: swaggerOptions
    }, {
        register: require('h2o2')
    }, {
        register: require('good'),
        options: goodOptions
    }
], function(err) {
    if (err) {
        server.log('An error ocurred trying to Register the plugins' + err);
    }
});

if (Config.env === 'test') {
    server.settings.debug = {};
}
server.views({
    engines: {
        html: require('handlebars')
    },
    path: './views'
});

// Start the server
if (!module.parent) {
    server.start((err) => {
        if (err) {
            throw err;
        }
        console.info('Server running... ' + server.info.uri);
        console.log('PORT=' + server.info.port);
        console.log('NODE_ENV=' + environment);

        console.log('__dirname = ' + __dirname +
                    '\nprocess.cwd = ' + process.cwd());
    });
}

module.exports = server;
