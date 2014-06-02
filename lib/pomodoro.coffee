{exec, child} = require 'child_process'
PomodoroTimer = require './pomodoro-timer'
PomodoroView = require './pomodoro-view'

module.exports =
  configDefaults:
    pathToExecuteWithTimerStart: ""
    pathToExecuteWithTimerAbort: ""
    pathToExecuteWithTimerFinish: ""
    playSounds: true

  activate: ->
    atom.workspaceView.command "pomodoro:start", => @start()
    atom.workspaceView.command "pomodoro:abort", => @abort()
    @timer = new PomodoroTimer()
    @view = new PomodoroView(@timer)
    atom.workspaceView.statusBar.prependRight(@view)

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

  deactivate: ->
    @view?.destroy()
    @view = null
