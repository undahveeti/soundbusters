const mysql = require('mysql2');

const connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	password : process.env.MYSQL_PASSWORD,
	database : 'db'
});

module.exports = connection;