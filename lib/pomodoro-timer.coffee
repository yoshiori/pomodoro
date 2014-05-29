module.exports =
class PomodoroTimer

  TIME = 25 * 60 * 1000

  constructor: ->
    console.log "pomodoro timer constructor"
    @ticktack = new Audio(require("../resources/ticktack").data())
    @bell = new Audio(require("../resources/bell").data())
    @ticktack.loop = true

  start:->
    @ticktack.play()
    @startTime = new Date()
    @timer = setInterval ( => @step() ), 1000

  abort: ->
    @ticktack.pause()
    clearTimeout @timer
    @status = "aborted (#{new Date()})"

  finish: ->
    @ticktack.pause()
    clearTimeout @timer
    @bell.play()
    @status = "finished (#{new Date()})"

  step: ->
    time = (TIME - (new Date() - @startTime)) / 1000
    if time <= 0
      @finish()
    else
      @status = "#{Math.floor(time / 60)}:#{Math.floor(time % 60)}"
    console.log @status
