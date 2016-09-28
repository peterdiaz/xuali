var Promise = require("bluebird");
var getSqlConnection = require('../database');

module.exports = {
  findByEmail: function (email) {
    return Promise.using(getSqlConnection(), function (connection) {
      return connection.query('select * from USUARIO where DS_EMAIL = ?', [email]);
    });
  },

  save: function (Usuario) {
    return Promise.using(getSqlConnection(), function (connection) {
      return connection.query('INSERT INTO USUARIO (CD_TIPO_DOCUMENTO, ID_DOCUMENTO, NOMBRE, DS_EMAIL, DS_PASSWORD) VALUES (?,?,?,?,?)', [Usuario.tipoDocumento, Usuario.idDocumento, Usuario.nombre, Usuario.email, Usuario.password]);
    });
  }

}