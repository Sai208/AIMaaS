const Sequelize = require('sequelize');
const sequelize = new Sequelize('nodetut', 'root', 'root', {
          host: 'localhost',
          dialect: 'mysql',
          pool: {
                    max: 1000,
                    min: 1,
                    idle: 1000
          },
          define: {
                    timestamps: false,
                    freezeTableName: true
          }
});

sequelize.authenticate().then(()=>{
          console.log('Connection has been established successfully');
}).catch(err => {
          console.log('Unable to connect to the database:', err);
});

module.exports = sequelize;
