path = require('path')

module.exports = (robot) ->
  createListener = (config, robot) ->
    robot[config.listener] config.match, (msg) ->
      msg.send msg.random config.responses

  registerListeners = (config, robot) ->
    createListener entry, robot for entry in config

  files = require('glob').sync(process.env.HUBOT_RESPONSE_GLOB)
  registerListeners require(path.resolve(config)), robot for config in files
