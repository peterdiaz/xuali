module.exports = function(sequelize, DataTypes) {
    return sequelize.define('storage_service', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        cd_token: {
            type: DataTypes.STRING,
            allowNull: false
        },
        ds_path: {
            type: DataTypes.STRING,
            allowNull: false
        },
        ds_filename: {
            type: DataTypes.STRING,
            allowNull: false
        },
        cd_repository: {
            type: DataTypes.STRING,
            allowNull: false
        },
        dt_storage: {
            type: DataTypes.DATE,
            allowNull: true
        },
        cd_content_type: {
            type: DataTypes.STRING,
            allowNull: false
        },
        in_amazon_s3: {
            type: DataTypes.BOOLEAN,
            allowNull: false
        }
    }, {
        tableName: 'storage_service',
        timestamps: false
    });
};
