module.exports =
  activate: ->
    atom.workspaceView.command "pomodoro:start", => @start()
    atom.workspaceView.command "pomodoro:stop", => @stop()
    @ticktack = new Audio('https://raw.githubusercontent.com/yoshiori/pomodoro/master/resources/ticktack.ogg')
    @bell = new Audio('https://raw.githubusercontent.com/yoshiori/pomodoro/master/resources/bell.ogg')
    @ticktack.loop = true

  start: ->
    console.log "pomodoro: start"
    console.log "muted: #{@ticktack.loop}, volume: #{@ticktack.volume}, loop: #{@ticktack.loop}"

    @ticktack.play()
    @timer = setTimeout ( => @finish() ), 25 * 60 * 1000

  stop: ->
    console.log "pomodoro: stop"
    @ticktack.pause()
    clearTimeout @timer

  finish: ->
    console.log "pomodoro: finish"
    @stop()
    @bell.play()
