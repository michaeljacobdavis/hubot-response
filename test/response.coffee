chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hubot-response', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/response')(@robot)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledTwice

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledOnce
