const mysql = require('mysql2');
const express = require('express');
const session = require('express-session');
const path = require('path');

const router = express.Router();

const connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	password : 'georgerusty123',
	database : 'login'
});

// user login
router.post('/login', function(request, response) {
	// Capture the input fields
	let username = request.body.username;
	let password = request.body.password;
	// Ensure the input fields exists and are not empty
	if (username && password) {
		// Execute SQL query that'll select the account from the database based on the specified username and password
		connection.query('SELECT * FROM users WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			// If there is an issue with the query, output the error
			if (error) throw error;
			// If the account exists
			if (results.length > 0) {
				// Authenticate the user
				request.session.loggedin = true;
				request.session.username = username;
				// Redirect to home page
				response.redirect('/home');
			} else {
				response.send('Incorrect Username and/or Password!');
			}			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});


// user registration
router.post('/register', function(request, response) {
	// Capture the input fields
    let email = request.body.email;
	let username = request.body.username;
	let password = request.body.password;
	// Ensure the input fields exists and are not empty
	if (username && password && email) {
        const user = {
            username: username,
            email: email,
            password: password
        };

        connection.query('INSERT INTO users SET ?', user, (err, result) => {
            if (err) {
                // Database query error
                response.status(500).send(`Registration failed: ${err.message}`);
            } else {
                // Registration successful
                response.status(201).send('Registration successful! You can now log in.');
            }
        });

	} else {
		response.send('Please enter Email, Username, and Password!');
		response.end();
	}
});


module.exports = router;