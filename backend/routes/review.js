const express = require('express');

const router = express.Router();
var connection = require('./connection');

// post review
router.post('/review', function(request, response) {
    let user = request.body.user;
	let review = request.body.review;
    const entry = {
        user: user,
        review: review
    };
    connection.query('INSERT INTO album_review SET ?', entry, (err, result) => {
        if (err) {
            // Database query error
            response.status(500).send(`Review failed: ${err.message}`);
        } else {
            // Registration successful
            response.status(201).send(`Review posted ${user}`);
        }
    });
	
});
// post review
router.post('/review/comment', function(request, response) {
    let user = request.body.user;
    let review = request.body.review;
	let comment = request.body.comment;
    const entry = {
        user: user,
        review: review,
        comment: comment
    };
    connection.query('INSERT INTO album_review_comment SET ?', entry, (err, result) => {
        if (err) {
            // Database query error
            response.status(500).send(`Review failed: ${err.message}`);
        } else {
            // Registration successful
            response.status(201).send(`Review posted ${user}`);
        }
    });
	
});

module.exports = router;

