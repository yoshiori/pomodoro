{WorkspaceView} = require 'atom'
Pomodoro = require '../lib/pomodoro'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

# describe "Pomodoro", ->
#   activationPromise = null
#
#   beforeEach ->
#     atom.workspaceView = new WorkspaceView
#     activationPromise = atom.packages.activatePackage('pomodoro')
#
#   describe "when the pomodoro:toggle event is triggered", ->
#     it "attaches and then detaches the view", ->
#       expect(atom.workspaceView.find('.pomodoro')).not.toExist()
#
#       # This is an activation event, triggering it will cause the package to be
#       # activated.
#       atom.workspaceView.trigger 'pomodoro:toggle'
#
#       waitsForPromise ->
#         activationPromise
#
#       runs ->
#         expect(atom.workspaceView.find('.pomodoro')).toExist()
#         atom.workspaceView.trigger 'pomodoro:toggle'
#         expect(atom.workspaceView.find('.pomodoro')).not.toExist()
