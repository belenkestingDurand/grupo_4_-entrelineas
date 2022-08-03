
module.exports = (sequelize, dataTypes) => {

    let alias = 'User';
    let cols = {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER,
        },
        firstName: { 
            type: dataTypes.STRING(100),
        },
        lastName: { 
            type: dataTypes.STRING(100),
        },
        email: { 
            type: dataTypes.STRING(100),
        },
        password: { 
            type: dataTypes.STRING(200),
        },
        profilePic: { 
            type: dataTypes.STRING(100),
        }
    };
    let config = {
        tableName: "users",
        timestamps: false
    
    };
    
    const User = sequelize.define(alias, cols, config);
    User.associate = function(models) {  
        User.hasMany(models.UserAdress, {
            as: "adresses", 
            foreignKey: "id_user"
        })

        User.belongsTo(models.UserCategory, {
            as: "UsersCategories", 
            foreignKey: "id_userCategory"
        }) 
    }
   
    
    return User;
          
        }
    
   