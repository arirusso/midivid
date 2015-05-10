# midivid
# Control video players with MIDI
#
# (c)2015 Ari Russo
# Apache 2.0 License

# libs
require "forwardable"
require "midi-eye"
require "scale"
require "unimidi"

# modules
require "midivid/helper/numbers"
require "midivid/instructions"
require "midivid/midi"

# classes
require "midivid/context"

module MIDIVid

  VERSION = "0.0.1"

  # Shortcut to Context constructor
  def self.new(*args, &block)
    Context.new(*args, &block)
  end

end
