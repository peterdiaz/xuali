var mysql = require('promise-mysql');
var config = require('../config');

pool = mysql.createPool({
    host: config.db.host,
    user: config.db.user,
    password: config.db.password,
    database: config.db.database,
    connectionLimit: 10
});

function getSqlConnection() {
    return pool.getConnection().disposer(function (connection) {
        pool.releaseConnection(connection);
    });
}

module.exports = getSqlConnection;