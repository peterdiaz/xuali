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
  },

   save: function (Pregunta) {
    return Promise.using(getSqlConnection(), function (connection) {
      return connection.query('INSERT INTO USUARIO (CD_TIPO_DOCUMENTO, ID_DOCUMENTO, NOMBRE, DS_EMAIL, DS_PASSWORD) VALUES (?,?,?,?,?)', [Usuario.tipoDocumento, Usuario.idDocumento, Usuario.nombre, Usuario.email, Usuario.password]);
    });
  }


}