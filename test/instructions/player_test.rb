require "helper"

class MIDIVid::Instructions::PlayerTest < Minitest::Test

  context "Player" do

    setup do
      @input = Object.new
      @player = Object.new
      @player.stubs(:player_send)
      @player.stubs(:player_respond_to?)
      @context = MIDIVid::Context.new(@input, @player)
      assert @context.kind_of?(MIDIVid::Instructions::Player)
    end

    teardown do
      @player.unstub(:player_send)
      @player.unstub(:player_respond_to?)
    end

    context "#on_end_of_file" do

      setup do
        @context.player.expects(:add_end_of_file_callback).once.returns({})
      end

      teardown do
        @context.player.unstub(:add_end_of_file_callback)
      end

      should "assign callback" do
        refute_nil @context.on_end_of_file { something }
      end

    end

    context "#method_missing" do

      setup do
        @player.expects(:player_respond_to?).once.with(:seek).returns(true)
        @player.expects(:player_send).once.with(:seek, 50, :percent).returns(true)
      end

      should "delegate" do
        refute_nil @context.seek(50, :percent)
      end

    end

    context "#respond_to?" do

      setup do
        @player.expects(:player_respond_to?).once.with(:seek).returns(true)
      end

      should "delegate" do
        refute_nil @context.respond_to?(:seek)
      end

    end

  end
end
