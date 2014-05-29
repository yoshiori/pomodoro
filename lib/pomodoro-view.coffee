{View} = require 'atom'

module.exports =
class PomodoroView extends View
  @content: ->
    @div class: "pomodoro inline-block", =>
      @span style: "color: red", "#{String.fromCharCode(10086)} "
      @span outlet: 'statusText'

  initialize: (timer) ->
    timer.setUpdateCallback(@update)

  destroy: ->
    @detach()

  update: (status) =>
    @statusText.text(status)
