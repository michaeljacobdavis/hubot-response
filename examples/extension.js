var merge = require('lodash.merge');
module.exports = [
  merge(require('hubot-response-applause'), {
    responses: [
      'applause!'
    ]
  })
];
