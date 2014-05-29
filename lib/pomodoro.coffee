{exec, child} = require 'child_process'
PomodoroTimer = require './pomodoro-timer'

module.exports =
  configDefaults:
    pathToExecuteWithTimerStart: ""
    pathToExecuteWithTimerAbort: ""
    pathToExecuteWithTimerFinish: ""

  activate: ->
    atom.workspaceView.command "pomodoro:start", => @start()
    atom.workspaceView.command "pomodoro:abort", => @abort()
    @timer = new PomodoroTimer()

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
    setTimeout ( => @exec(atom.config.get("pomodoro.pathToExecuteWithTimerFinish")) ), 2 * 1000

  exec: (path) ->
    if path
      exec path, (err, stdout, stderr) ->
        if stderr
          console.log stderr
        console.log stdout
