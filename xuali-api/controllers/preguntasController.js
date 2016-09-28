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
}];