# Configuration:
#   HUBOT_RESPONSE_GLOB

path = require 'path'
glob = require 'glob'

module.exports = (robot) ->

  # Environment Variables
  responseDir = process.env.HUBOT_RESPONSE_GLOB || 'responses/*.*'

  # `createListener`
  # @param  {Object} config
  # @param  {String} config.listener                  Listener type `hear` or `respond`
  # @param  {String|RegExp} config.match              Either a string or regular expression to match
  # @param  {String} config.description               Description added to the list of Commands for hubot (`hubot-help`)
  # @param  {Array|String|Function} config.response   What to say. If string, it will respond with that. Array will choose randomly. Function will be called.
  # @param  {Object} robot                            Hubot instance
  createListener = (config, robot) ->

    # If it's not already a regular expression, create one
    unless config.match instanceof RegExp
      config.match = new RegExp(config.match, 'gi')

    # Register the listener
    robot[config.listener] config.match, (msg) ->
      # Handle response based on the type
      if typeof config.response is 'string'
        return msg.send config.response
      else if typeof config.response is 'function'
        return config.response.call(this, msg, config, robot)
      else if Array.isArray(config.response)
        return msg.send msg.random config.response

      robot.logger.warn 'unknown response type for #{config.match}'

    # Register the command if it has a description
    if config.description
      robot.commands.push config.description

  registerListeners = (config, robot) ->
    # Handle one or an array of configs
    if Array.isArray(config)
      createListener entry, robot for entry in config
    else createListener config, robot

  files = glob.sync responseDir
  registerListeners require(path.resolve(config)), robot for config in files
