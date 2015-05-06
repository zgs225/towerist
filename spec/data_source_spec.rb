# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Towerist::DataSource do
  context "if data source is exists" do
    before { @data_source = generate_data_source }

    it "should provide correct keywords" do
      @data = @data_source.provide

      expect(@data.length > 0).to be_truthy
    end
  end
end
