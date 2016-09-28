var Promise = require("bluebird");
var getSqlConnection = require('../database');

module.exports = {

  findAll: function (res) {
    return Promise.using(getSqlConnection(), function (connection) {
      return connection.query('select * from PREGUNTA');
    });
  },

  findById: function (id) {
    return Promise.using(getSqlConnection(), function (connection) {
      return connection.query('select p.*, r.* FROM PREGUNTA p LEFT JOIN RESPUESTA r ON p.ID_PREGUNTA = r.ID_PREGUNTA WHERE p.ID_PREGUNTA = ?', [id]);
    });
  }


}