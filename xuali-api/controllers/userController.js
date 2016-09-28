var Joi = require('joi');
var Boom = require('boom');
var Config = require('../config');
var User = require('../repositories/user');


module.exports = [{
    method: 'POST',
    path: '/api/usuario/registro',
    config: {
      validate: {
        payload: {
          tipoDocumento: Joi.string().required(),
          idDocumento: Joi.required(),
          nombre: Joi.string().required(),
          email: Joi.string().email().required(),
          password: Joi.string().required()
        }
      },
      handler: function (request, reply) {
        var Usuario = {
          tipoDocumento: request.payload.tipoDocumento,
          idDocumento: request.payload.idDocumento,
          nombre: request.payload.nombre,
          email: request.payload.email,
          password: request.payload.password
        };

        User.findByEmail(Usuario.email)
          .catch(function (err) {
            console.log(err);
          })
          .then(function (user) {
            if (user.length > 0) {
              reply(Boom.conflict('Hay un usuario registrado con ese email', Usuario.email));
            } else {
              User.save(Usuario)
                .then(function (res) {
                  reply({
                    Id: res.insertId, 
                    email: Usuario.email, 
                    basicAuth: new Buffer(Usuario.email+':'+ Usuario.password).toString('base64') 
                  });
                })
                .catch(function (err) {
                  reply(Boom.badRequest(err));
                });
            }
          });
      }
    }
  }, {
    method: 'POST',
    path: '/api/usuario/login',
    config: {
      validate: {
        payload: {
          email: Joi.string().email().required(),
          password: Joi.string().required()
        }
      },
      handler: function (request, reply) {
        var Login = {
          email: request.payload.email,
          password: request.payload.password
        };

        User.findByEmail(Login.email)
          .catch(function (err) {
            console.log(err);
          })
          .then(function (user) {
            if (user.length > 0) {
              if (Login.password == user[0].DS_PASSWORD) {
                var Usuario = {
                  nombre: user[0].NOMBRE,
                  id: user[0].ID_USUARIO,
                  email: user[0].DS_EMAIL,
                  tipoDocumento: user[0].CD_TIPO_DOCUMENTO,
                  idDocumento: user[0].ID_DOCUMENTO,
                  basicAuth: new Buffer(user[0].DS_EMAIL+':'+ user[0].DS_PASSWORD).toString('base64')
                };
                reply(Usuario);
              } else {
                reply(Boom.badRequest('Usuario o Clave Invalida'));
              }
            } else {
              reply(Boom.badRequest('Usuario o Clave Invalida'));
            }
          });
      }
    }
  }


];