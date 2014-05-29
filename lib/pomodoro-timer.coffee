module.exports =
class PomodoroTimer
  constructor: ->
    console.log "pomodoro timer constructor"
    @ticktack = new Audio(require("../resources/ticktack").data())
    @bell = new Audio(require("../resources/bell").data())
    @ticktack.loop = true

  start:->
    @ticktack.play()
    @timer = setTimeout ( => @finish() ), 25 * 60 * 1000

  abort: ->
    @ticktack.pause()
    clearTimeout @timer

  finish: ->
    @ticktack.pause()
    @bell.play()
