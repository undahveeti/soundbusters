const mysql = require('mysql2');
const express = require('express');
const session = require('express-session');
const path = require('path');
const expressValidator = require('express-validator');
const flash = require('express-flash');
require("dotenv").config();

const app = express();

app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'static')));
app.use(expressValidator());
app.use(flash());

// Set up EJS as the view engine
app.set('view engine', 'ejs');

// Set up the views directory if not using default
app.set('views', path.join(__dirname, 'views'));

const loginRouter = require('./routes/login.js');
const followRouter = require('./routes/follower.js');
app.use('/', loginRouter);
app.use('/', followRouter);

// http://localhost:3000/
app.get('/', function(request, response) {
	// Render login template
	response.sendFile(path.join(__dirname + '/pages/login.html'));
});


// http://localhost:3000/home
app.get('/home', function(request, response) {
	// If the user is loggedin
	if (request.session.loggedin) {
		// Output username
		response.send('Welcome back, ' + request.session.username + '!');
	} else {
		// Not logged in
		response.send('Please login to view this page!');
	}
	response.end();
});

app.listen(3000);
// module.exports = app;