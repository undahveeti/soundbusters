const express = require('express');

const router = express.Router();
var connection = require('./connection');

// post album rating
router.post('/rate/album', function(request, response) {
    let user = request.body.user;
    let album = request.body.album;
	let rating = request.body.rating;
    const entry = {
        user: user,
        album: album,
        rating: rating
    };
    connection.query('INSERT INTO album_rating SET ?', entry, (err, result) => {
        if (err) {
            // Database query error
            response.status(500).send(`Album rating failed: ${err.message}`);
        } else {
            // Registration successful
            response.status(201).send(`Album rating posted ${user}`);
        }
    });
	
});

// post track rating
router.post('/rate/track', function(request, response) {
    let user = request.body.user;
    let track = request.body.track;
	let rating = request.body.rating;
    const entry = {
        user: user,
        track: track,
        rating: rating
    };
    connection.query('INSERT INTO track_rating SET ?', entry, (err, result) => {
        if (err) {
            // Database query error
            response.status(500).send(`Track rating failed: ${err.message}`);
        } else {
            // Registration successful
            response.status(201).send(`Track rating posted ${user}`);
        }
    });
	
});


// post artist rating
router.post('/rate/track', function(request, response) {
    let user = request.body.user;
    let artist = request.body.artist;
	let rating = request.body.rating;
    const entry = {
        user: user,
        artist: artist,
        rating: rating
    };
    connection.query('INSERT INTO artist_rating SET ?', entry, (err, result) => {
        if (err) {
            // Database query error
            response.status(500).send(`Artist rating failed: ${err.message}`);
        } else {
            // Registration successful
            response.status(201).send(`Artist rating posted ${user}`);
        }
    });
	
});

module.exports = router;