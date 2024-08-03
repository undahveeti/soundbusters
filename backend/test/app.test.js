const request = require('supertest');
const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const flash = require('connect-flash');
const sinon = require('sinon');
const chai = require('chai');
const expect = chai.expect;

// Create a mock express app
const app = express();

// Middleware setup
app.use(bodyParser.urlencoded({ extended: false }));
app.use(session({ secret: 'test', resave: false, saveUninitialized: true }));
app.use(flash());

// Stub database connection
const connection = {
  query: sinon.stub()
};
app.locals.connection = connection;

// Register route
const router = require('../routes/register'); // Replace with your actual path
app.use('/', router);

describe('POST /register', function() {
  
  beforeEach(function() {
    // Reset the stubs before each test
    connection.query.reset();
  });

  it('should redirect to /login on successful registration', function(done) {
    // Mock successful database query
    connection.query.yields(null, { insertId: 1 });

    request(app)
      .post('/register')
      .send({ username: 'testuser', email: 'testuser@example.com', password: 'testpassword' })
      .expect('Location', '/login')
      .expect(302, done);
  });

  it('should render registration page with error messages if validation fails', function(done) {
    request(app)
      .post('/register')
      .send({ username: '', email: 'invalid-email', password: '' })
      .expect('Content-Type', /html/)
      .expect(200)
      .end((err, res) => {
        if (err) return done(err);
        expect(res.text).to.contain('Username is required');
        expect(res.text).to.contain('A valid email is required');
        done();
      });
  });

  it('should render registration page with error message if there is a database error', function(done) {
    // Mock database error
    connection.query.yields(new Error('Database error'));

    request(app)
      .post('/register')
      .send({ username: 'testuser', email: 'testuser@example.com', password: 'testpassword' })
      .expect('Content-Type', /html/)
      .expect(200)
      .end((err, res) => {
        if (err) return done(err);
        expect(res.text).to.contain('Database error');
        done();
      });
  });
});