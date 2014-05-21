module.exports =
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

  abort: ->
    console.log "pomodoro: abort"
    @ticktack.pause()
    clearTimeout @timer

  finish: ->
    console.log "pomodoro: finish"
    @ticktack.pause()
    @bell.play()
