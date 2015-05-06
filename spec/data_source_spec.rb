# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Towerist::DataSource do
  context "if data source is exists" do
    before do
      @data_source = Towerist::DataSource.new(File.expand_path 'data/source/tower.html', root)
    end

    it "should provide correct keywords" do
      @data = @data_source.provide

      expect(@data.length > 0).to be_truthy
    end
  end
end
