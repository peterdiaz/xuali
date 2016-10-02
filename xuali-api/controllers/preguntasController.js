var Boom = require('boom');
var Joi = require('joi')

var repos = require('../repositories');

module.exports = [{
  method: 'GET',
  path: '/api/preguntas',
  config: {
    auth: 'simple',
    handler: (req, reply) => {
      repos.preguntas.findAll()
        .then(data => {
          reply(data);
        }).catch(err => {
          console.log(err);
          Boom.badImplementation('terrible implementation');
        });
    }
  }
},
{
  method: 'GET',
  path: '/api/preguntas/{id}',
  config: {
    auth: 'simple',
    handler: (req, reply) => {
      repos.preguntas.findById(req.params.id)
        .then(data => {
          reply(data);
        }).catch(err => {
          console.log(err);
          Boom.badImplementation('terrible implementation');
        });
    }
  }
},
{
    method: 'POST',
    path: '/api/preguntas',
    config: {
      validate: {
        payload: {
          idUsuario: Joi.string().required(),
          titulo: Joi.string().required(),
          pregunta: Joi.string().required()
        }
      },
      handler: function (request, reply) {
        var Usuario = {
          idUsuario: request.payload.idUsuario,
          titulo: request.payload.titulo,
          pregunta: request.payload.pregunta
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
  }];