#!/usr/bin/env ruby

require 'time'
require 'curses'

class Clockout
  def initialize(clockin, lunchout, lunchin)
    @clockin = clockin
    @lunchout = lunchout
    @lunchin = lunchin
  end

  def solve
    accum = @lunchout - @clockin
    timelft = (8*60*60) - accum
    clockout = @lunchin + timelft
    $clockout = clockout.strftime("%I:%M %p!")
  end

  def self.loop(input, x, y)
    timeregex = [/^(((([0-1][0-9])|(2[0-3])):?[0-5][0-9])|(24:?00))/,
                /^([0-9]|([1][0-2])):[0-5][0-9][[:space:]]?([ap][m]?|[AP][M]?)/]
    reg = Regexp.union(timeregex)
    until input.match(reg)
      Curses.setpos(x, y)
      Curses.addstr "Try again using a time"
      Curses.getch
      Curses.setpos(x, y)
      Curses.addstr "                         "
      Curses.setpos(x, y)
      input = Curses.getstr
      $input = input
    end
  end

  def self.clearTerminal
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system 'cls'
    else
      system 'clear'
    end
  end
end

Clockout.clearTerminal

Curses.init_screen

begin
  Curses.addstr("    -------------------------------------------------------------------------
    |▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓Walk Out With Your Clock Out!🕒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓|
    -------------------------------------------------------------------------
    |    Usage: To find out what time you are able to clock out, please     |
    |    enter your times for the following.                                |
    |    Use one of the following formats: 0:00[am/pm] or 00:00             |
    |                                                                       |
    |    What time did you clock in?                                        |
    |                                                                       |
    |    What time did you clock out for lunch?                             |
    |                                                                       |
    |    What time did you clock in from lunch?                             |
    |                                                                       |
    |                                                                       |
    |    You can clock out at...                                            |
    |                                                                       |
    |                                                                       |
    |_______________________________________________________________________|")

    clock = {}
    pos=[7,37,9,48,11,48,14,33]

    Curses.setpos(pos[0], pos[1])
    $input = Curses.getstr
    Clockout.loop($input, pos[0], pos[1])
    clock[:clockin] = Time.parse($input)

    Curses.setpos(pos[2], pos[3])
    $input = Curses.getstr
    Clockout.loop($input, pos[2], pos[3])
    clock[:lunchout] = Time.parse($input)

    Curses.setpos(pos[4], pos[5])
    $input = Curses.getstr
    Clockout.loop($input, pos[4], pos[5])
    clock[:lunchin] = Time.parse($input)

    Curses.setpos(pos[6], pos[7])
    Clockout.new(clock[:clockin], clock[:lunchout], clock[:lunchin]).solve
    Curses.addstr($clockout)
    Curses.getch
ensure
  Curses.close_screen
end
