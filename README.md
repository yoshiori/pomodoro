# Pomodoro  - Atom package *Beta*

Pomodoro is an Atom package that is simple timer for Pomodoro Technique.

![](https://www.evernote.com/shard/s4/sh/834d812b-b56d-4f51-b872-9f42591f62a1/892711b9985511ebc91056e5ffef0d4e/deep/0/README.md----Users-yoshiori-shoji-.atom-packages-pomodoro-%E3%81%A8-Atom.png)

## Pomodoro Technique?
The time management technique. For more information, [click here](http://pomodorotechnique.com/).

## Installation

    $ apm install pomodoro

## Usage

The following commands are available for you to remap and/or run via the command palette.

* `pomodoro:start` - Start timer
* `pomodoro:abort` - Abort timer

### Set Execute Command

![](https://www.evernote.com/shard/s4/sh/5bd4dd38-3eb4-41c5-a8db-a6fb97f2dbe3/d41b10d4d482748a14c40e0590f9a321/deep/0/Settings----Users-yoshiori-.atom-packages-pomodoro.png)

#### for example

- Create Shell Script file. Set file permission 755.

```sh
#!/bin/sh
/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend  
```

- Set Shell Script file path to `Path to Execute With Timer Finish`

- Pomodoro finish -> suspend computer.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
