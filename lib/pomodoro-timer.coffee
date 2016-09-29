events = require 'events'

module.exports =
class PomodoroTimer extends events.EventEmitter


  constructor: ->
    @ticktack = new Audio(require("../resources/ticktack").data())
    @bell = new Audio(require("../resources/bell").data())
    @ticktack.loop = true

  start: ->
    if atom.config.get("pomodoro.playTicks")
      @ticktack.play()
    @startTime = new Date()
    @minutes = atom.config.get("pomodoro.period")
    @timer = setInterval ( => @step() ), 1000

  abort: ->
    @status = "aborted (#{new Date()})"
    @stop()

  time: ->
    @minutes * 60 * 1000

  finish: ->
    @status = "finished (#{new Date()})"
    @stop()
    if atom.config.get("pomodoro.playBell")
      @bell.play()

  stop: ->
    @ticktack.pause()
    clearTimeout @timer
    @updateCallback(@status)

  step: ->
    time = (@time() - (new Date() - @startTime)) / 1000
    if time <= 0
      @emit 'finished'
    else
      min = @zeroPadding(Math.floor(time / 60))
      sec = @zeroPadding(Math.floor(time % 60))
      @status = "#{min}:#{sec}"
      @updateCallback(@status)

  zeroPadding: (num) ->
    ("0" + num).slice(-2)

  setUpdateCallback: (fn) ->
    @updateCallback = fn
