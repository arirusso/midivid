require "midivid/midi/message_handler"
require "midivid/midi/wrapper"

module MIDIVid

  module MIDI

    def self.new(*args)
      ::MIDIVid::MIDI::Wrapper.new(*args)
    end

  end

end
