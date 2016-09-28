var Promise = require("bluebird");
var getSqlConnection = require('../database');

module.exports = {

  findAll: function (res) {
    return Promise.using(getSqlConnection(), function (connection) {
      return connection.query('select * from HISTORIA');
    });
  }
}