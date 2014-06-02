module.exports =
class PomodoroTimer

  TIME = 25 * 60 * 1000

  constructor: ->
    @ticktack = new Audio(require("../resources/ticktack").data())
    @bell = new Audio(require("../resources/bell").data())
    @ticktack.loop = true

  start: ->
    if atom.config.get("pomodoro.playSounds")
      @ticktack.play()
    @startTime = new Date()
    @timer = setInterval ( => @step() ), 1000

  abort: ->
    @status = "aborted (#{new Date()})"
    @stop()

  finish: ->
    @status = "finished (#{new Date()})"
    @stop()
    if atom.config.get("pomodoro.playSounds")
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
      min = @zeroPadding(Math.floor(time / 60))
      sec = @zeroPadding(Math.floor(time % 60))
      @status = "#{min}:#{sec}"
      @updateCallback(@status)

  zeroPadding: (num) ->
    ("0" + num).slice(-2)

  setUpdateCallback: (fn) ->
    @updateCallback = fn
