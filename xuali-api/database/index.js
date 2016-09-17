var Sequelize = require('sequelize');
var requireDir = require('require-dir');
var config = require('./dbConfig');
var path = require('path');

var sequelize = new Sequelize(
    config.databaseName,
    config.user,
    config.password, {
        host: config.host,
        port: config.port,
        dialect: config.dialect
    }
);

//Create Models
var models = requireDir('./models');

for (var model in models) {
    module.exports[model] = sequelize.import(path.join(__dirname, 'models', model));
}

module.exports.sequelize = sequelize;