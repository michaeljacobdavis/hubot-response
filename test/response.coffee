chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hubot-response', ->
  beforeEach ->
    @robot =
      commands: []
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/response')(@robot)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledTwice

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledOnce

  it 'adds `description` to the list of commands', ->
    expect(@robot.commands).to.include 'hear'
    expect(@robot.commands).to.include 'respond'
    expect(@robot.commands.length).to.equal 2
