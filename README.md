# WOWYCO(Walk Out With Your Clock Out!)

<p>WOWYCO is a terminal application, written in Ruby language, that allows the user to enter in their clock-in and clock-out times, then returns the time in which they can clock out based on an 8hr work day.</p>

## Motivation

<p>I created this application because I am constantly clocking into work at different times each day and often taking a different duration of lunch. I saw calculating my hours in order to find what time I could clock out for the day to be rather inconvenient and annoying. What better way to test out my newly acquired Ruby skills than this simple, yet useful application!</p>

## Screenshots

<p/>![ScreenShot](/screenshots/screenshot.png)</p>

## Tech
<p>Ruby 2.3.7</p>

## Installation

<p>From the command-line, clone the repository where you want it.</br>
</br>

`git clone https://github.com/hkn34/WOWYCO.git`</br>
`cd WOWYCO`</p>

**Automated**

<p>If you have bundler installed (gem install bundler), from inside the base repository directory, run:</p>

`bundle install` # Install 'rake' if not already installed</br>
`rake`           # Link the executable in your path ('/usr/local/bin')

<p>To uninstall, run `rake uninstall`</p>

**Manual**

<p>If you aren't using bundler or rake, you can manually link executable. From inside the base repository directory, run:</p>

`ln -s $PWD/bin/WOWYCO /usr/local/bin/WOWYCO`

<p>To uninstall, run `rm /usr/local/bin/WOWYCO</p>`


## Usage

<p>To use WOWYCO:</br>
</br>
`WOWYCO` # Run in Command-line</br>
</br>
Enter in the corresponding times, when prompted, in the format of (0:00[am/pm] or 00:00).</p>

## License
<p>This project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT)</p>

<p>MIT © Houston Knight</p>
