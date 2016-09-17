'use strict';

var _ = require('lodash');

var env = process.env.NODE_ENV || 'development';

// All configurations will extend these options
// ============================================
var all = {
    env: env,

    // Server port
    port: process.env.PORT || 3000,

};

// Export the config object based on the NODE_ENV
// ==============================================
module.exports = _.merge(
    all,
    require('./shared'),
    require('./' + env + '.js') || {});
