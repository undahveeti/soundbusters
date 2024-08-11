const mysql = require('mysql2');
const express = require('express');
const session = require('express-session');
const path = require('path');

const router = express.Router();

var connection = require('./connection');

// follow someone
router.post('/follow', function(request, response) {
    let user = request.body.user;
	let follower = request.body.follower;
    const entry = {
        user: user,
        follower: follower
    };
    connection.query('INSERT INTO follower SET ?', entry, (err, result) => {
        if (err) {
            // Database query error
            response.status(500).send(`Follow failed: ${err.message}`);
        } else {
            // Registration successful
            response.status(201).send(`Now following user ${user}`);
        }
    });
	
});

// unfollow someone
router.post('/unfollow', function(request, response) {
    let user = request.body.user;
	let follower = request.body.follower;
    connection.query('DELETE FROM follower WHERE user = ? AND follower = ?', [user,follower], (err, result) => {
        if (err) {
            // Database query error
            response.status(500).send(`Unfollow failed: ${err.message}`);
        } else {
            // Registration successful
            response.status(201).send(`Unfollowed user ${user}`);
        }
    });
	
});

// get following
router.get('/following/:id', function(request, response) {
    connection.query('SELECT * FROM follower WHERE follower=?', request.params.id, (err, result) => {
        if (err) {
            // Database query error
            response.status(500).send(`Failed to get following: ${err.message}`);
        } else {
            // Registration successful
            const userList = result.map(item => item.user);
            response.send(userList);
        }
    });
});

module.exports = router;

