// Import the module you want
var config = require('hubot-response-applause').applause

// Extend whatever you wany
config.response.push('applause!');

// Export the altered object
module.exports = config;
