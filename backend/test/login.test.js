const request = require('supertest');
const app = require('../app.js');

describe("POST /login", () => {

  describe("given a username and password", () => {
    test("should respond with a 200 status code", async () => {
      const response = await request(app).post("/login").send({
        username: "test",
        password: "test"
      })
      expect(response.statusCode).toBe(200)
    })
  })

  describe("given a username and password", () => {
    test("should respond with\"logged in\" message", async () => {
      const response = await request(app).post("/login").send({
        username: "test",
        password: "test"
      })
      expect(response.text).toBe('Logged in')
    })
  })

})