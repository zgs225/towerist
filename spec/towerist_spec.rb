require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'fileutils'

describe "Towerist" do
  before do
    FileUtils.rm_rf(Dir[File.expand_path('html/data/**/*.csv', root)])

    `ruby "#{ root }/bin/towerist"`
  end

  context "work correctly that" do
    it "should generate csv files" do
      ['data', 'styles', 'sex'].each do |file|
        expect(File.exist?("#{ root }/html/data/#{ file }.csv")).to be true
      end
    end
  end
end
