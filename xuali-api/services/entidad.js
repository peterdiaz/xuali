'use strict';

var db = require('../database');

module.exports.findOne = function (params) {
    return db.storage_repository.findOne({
        where: {
            cd_repository: params.repository
        }
    });
};
