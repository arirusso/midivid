require "helper"

class MIDIVid::Instructions::MIDITest < Minitest::Test

  context "MIDI" do

    setup do
      @input = Object.new
      @player = Object.new
      @context = MIDIVid::Context.new(@input, @player)
      assert @context.kind_of?(MIDIVid::Instructions::MIDI)
    end

    context "#note" do

      setup do
        @context.midi.expects(:add_note_callback).once.returns({})
      end

      teardown do
        @context.midi.unstub(:add_note_callback)
      end

      should "assign callback" do
        refute_nil @context.note(1) { something }
      end

    end

    context "#cc" do

      setup do
        @context.midi.expects(:add_cc_callback).once.returns({})
      end

      teardown do
        @context.midi.unstub(:add_cc_callback)
      end

      should "assign callback" do
        refute_nil @context.cc(1) { |val| something }
      end

    end

    context "#system" do

      setup do
        @context.midi.expects(:add_system_callback).once.returns({})
      end

      teardown do
        @context.midi.unstub(:add_system_callback)
      end

      should "assign callback" do
        refute_nil @context.system(:stop) { something }
      end

    end

    context "#receive_channel" do

      setup do
        @context.midi.expects(:channel=).once.with(3).returns(3)
      end

      teardown do
        @context.midi.unstub(:channel=)
      end

      should "assign callback" do
        refute_nil @context.receive_channel(3)
      end

    end

  end
end
