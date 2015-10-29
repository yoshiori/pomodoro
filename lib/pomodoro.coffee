{exec, child} = require 'child_process'
PomodoroTimer = require './pomodoro-timer'
PomodoroView = require './pomodoro-view'

module.exports =
  config:
    period:
      type: "integer"
      default: 25
    pathToExecuteWithTimerStart:
      type: "string"
      default: ""
    pathToExecuteWithTimerAbort:
      type: "string"
      default: ""
    pathToExecuteWithTimerFinish:
      type: "string"
      default: ""
    playSounds:
      type: "boolean"
      default: true

  activate: ->
    atom.commands.add "atom-workspace",
      "pomodoro:start": =>  @start(),
      "pomodoro:abort": => @abort()

    @timer = new PomodoroTimer()
    @timer.on 'finished', => @finish()

  consumeStatusBar: (statusBar) ->
    @view = new PomodoroView(@timer)
    statusBar.addRightTile(item: @view, priority: 200)

  start: ->
    console.log "pomodoro: start"
    @timer.start()
    @exec atom.config.get("pomodoro.pathToExecuteWithTimerStart")

  abort: ->
    console.log "pomodoro: abort"
    @timer.abort()
    @exec atom.config.get("pomodoro.pathToExecuteWithTimerAbort")

  finish: ->
    console.log "pomodoro: finish"
    @timer.finish()
    @exec atom.config.get("pomodoro.pathToExecuteWithTimerFinish")

  exec: (path) ->
    if path
      exec path, (err, stdout, stderr) ->
        if stderr
          console.log stderr
        console.log stdout

  deactivate: ->
    @view?.destroy()
    @view = null
