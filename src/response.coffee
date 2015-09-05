path = require 'path'
glob = require 'glob'
module.exports = (robot) ->
  responseDir = process.env.HUBOT_RESPONSE_GLOB || 'responses/*.*'

  # `createListener`
  # @param  {Object} config
  # @param  {String} config.listener                  Listener type `hear` or `respond`
  # @param  {Array|String|Function} config.response   What to say. If string, it will respond with that. Array will choose randomly. Function will be called.
  # @param  {Object} robot                            Hubot instance
  createListener = (config, robot) ->
    robot[config.listener] config.match, (msg) ->
      if typeof config.response is 'string'
        return msg.send config.response
      else if typeof config.response is 'function'
        return msg.send config.response.call(this, msg, config, robot)
      else if Array.isArray(config.response)
        return msg.send msg.random config.response

  registerListeners = (config, robot) ->
    if Array.isArray(config)
      createListener entry, robot for entry in config
    else createListener config, robot



  files = glob.sync responseDir
  registerListeners require(path.resolve(config)), robot for config in files
