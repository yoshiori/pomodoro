module.exports =
  activate: ->
    atom.workspaceView.command "pomodoro:start", => @start()
    atom.workspaceView.command "pomodoro:stop", => @stop()
    @ticktack = new Audio('atom://pomodoro/resources/ticktack.mp3')
    @bell = new Audio('atom://pomodoro/resources/bell.mp3')

    @ticktack.loop = true

  start: ->
    console.log "pomodoro: start"
    console.log "muted: #{@ticktack.loop}, volume: #{@ticktack.volume}, loop: #{@ticktack.loop}"

    @ticktack.play()
    @timer = setTimeout ( => @finish() ), 25 * 60 * 1000

  stop: ->
    console.log "pomodoro: stop"
    @ticktack.stop()
    clearTimeout @timer

  finish: ->
    console.log "pomodoro: finish"
    @stop()
    @bell.play()
