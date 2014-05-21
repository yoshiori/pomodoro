{exec, child} = require 'child_process'
module.exports =
  configDefaults:
    pathToExecuteWithTimerStart: ""
    pathToExecuteWithTimerAbort: ""
    pathToExecuteWithTimerFinish: ""

  activate: ->
    atom.workspaceView.command "pomodoro:start", => @start()
    atom.workspaceView.command "pomodoro:abort", => @abort()
    @ticktack = new Audio(require("../resources/ticktack").data())
    @bell = new Audio(require("../resources/bell").data())
    @ticktack.loop = true

  start: ->
    console.log "pomodoro: start"
    console.log "muted: #{@ticktack.loop}, volume: #{@ticktack.volume}, loop: #{@ticktack.loop}"
    @ticktack.play()
    @timer = setTimeout ( => @finish() ), 25 * 60 * 1000
    @exec atom.config.get("pomodoro.pathToExecuteWithTimerStart")

  abort: ->
    console.log "pomodoro: abort"
    @ticktack.pause()
    clearTimeout @timer
    @exec atom.config.get("pomodoro.pathToExecuteWithTimerAbort")

  finish: ->
    console.log "pomodoro: finish"
    @ticktack.pause()
    @bell.play()
    setTimeout ( => @exec(atom.config.get("pomodoro.pathToExecuteWithTimerFinish")) ), 2 * 1000


  exec: (path) ->
    if path
      exec path, (err, stdout, stderr) ->
        if stderr
          console.log stderr
        console.log stdout
