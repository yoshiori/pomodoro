# Pomodoro  - Atom package

Pomodoro is an Atom package that is simple timer for Pomodoro Technique.

![](https://cloud.githubusercontent.com/assets/78609/10839658/dfc081e0-7f19-11e5-8eb1-73e638279c49.png)

## Pomodoro Technique?
The time management technique. For more information, [click here](http://pomodorotechnique.com/).

## Installation

    $ apm install pomodoro

## Usage

The following commands are available for you to remap and/or run via the command palette.

* `pomodoro:start` - Start timer
* `pomodoro:abort` - Abort timer

### Set Execute Command

![](https://cloud.githubusercontent.com/assets/78609/10839670/121eeef6-7f1a-11e5-98b5-d441bdd321b0.png)

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
