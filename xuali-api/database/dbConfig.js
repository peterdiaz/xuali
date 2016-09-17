var enviroments = {};
var env = process.env.NODE_ENV || 'development';

enviroments.development = {
    host: '17.0.0.1',
    port: '3306',
    databaseName: 'xualidb',
    user: 'root',
    password: 'root',
    dialect: 'mysql'
};

enviroments.test = {
    host: '0.0.0.0',
    port: '3306',
    databaseName: 'xualidb',
    user: 'root',
    password: 'root',
    dialect: 'mysql'
};

 enviroments.production = {
     host: '0.0.0.0',
     port: '3306',
     databaseName: 'xualidb',
     user: 'root',
     password: '',
     dialect: 'mysql'
 };

module.exports = enviroments[env];
