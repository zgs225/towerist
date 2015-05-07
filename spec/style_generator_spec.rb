# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'fileutils'

describe Towerist::StyleGenerator do
  before do
    @words = {
      男: 12,
      女: 12
    }
    @generator = Towerist::StyleGenerator.new @words
    @csv_file  = File.expand_path 'html/data/styles.csv', root
    FileUtils.rm_f @csv_file
  end

  it "should generate sex.csv file" do
    @generator.generate
    expect(File.exist?(@csv_file)).to be true
  end
end

