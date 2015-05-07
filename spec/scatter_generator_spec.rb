# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'fileutils'

describe Towerist::ScatterGenerator do
  before do
    @words = {
      大海: 2,
      地面: 4
    }
    @scatter_generator = Towerist::ScatterGenerator.new @words
    @csv_file = File.expand_path 'html/data/data.csv', root
    FileUtils.rm_f @csv_file
  end

  it "should generate data.csv file" do
    @scatter_generator.generate
    expect(File.exist?(@csv_file)).to be true
  end
end
