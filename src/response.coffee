# Description:
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Notes
#
# Author:

path = require('path')

module.exports = (robot) ->
  createListener = (config, robot) ->
    robot[config.listener] config.match, (msg) ->
      msg.send msg.random config.responses

  files = require('glob').sync(process.env.HUBOT_RESPONSE_GLOB)
  createListener require(path.resolve(config)), robot for config in files
