require 'spec_helper'

class ConfigSpec < MiniTest::Spec
  describe "Realtime::Config" do
    before do
      # Temporary fix until Config becomes an instance
      Realtime::Config.middleman = nil
      Realtime::Config.logger    = nil
    end

    it "must have accessors" do
      [:callback_url, :app_id, :secret, :verify_token, :logger, :middleman].each do |m|
        Realtime::Config.must_respond_to m
        Realtime::Config.must_respond_to "#{m}="
      end
    end

    it "must have a default logger" do
      Realtime::Config.logger.must_be_instance_of Logger
    end

    it "must have a default middleman" do
      Realtime::Config.middleman.must_equal Realtime::Middleman
    end
  end
end