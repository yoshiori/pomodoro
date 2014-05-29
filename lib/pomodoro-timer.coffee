module.exports =
class PomodoroTimer

  TIME = 25 * 60 * 1000

  constructor: ->
    @ticktack = new Audio(require("../resources/ticktack").data())
    @bell = new Audio(require("../resources/bell").data())
    @ticktack.loop = true

  start: ->
    @ticktack.play()
    @startTime = new Date()
    @timer = setInterval ( => @step() ), 1000

  abort: ->
    @status = "aborted (#{new Date()})"
    @stop()

  finish: ->
    @status = "finished (#{new Date()})"
    @stop()
    @bell.play()

  stop: ->
    @ticktack.pause()
    clearTimeout @timer
    @updateCallback(@status)

  step: ->
    time = (TIME - (new Date() - @startTime)) / 1000
    if time <= 0
      @finish()
    else
      @status = "#{Math.floor(time / 60)}:#{Math.floor(time % 60)}"
      @updateCallback(@status)

  setUpdateCallback: (fn) ->
    @updateCallback = fn
