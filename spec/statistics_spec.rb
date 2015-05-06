# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Towerist::Statistics do

  before do
    @data_source = generate_data_source
    @statistics  = Towerist::Statistics.new @data_source
  end

  context "text from data source should be segmented" do
    it "should have a __origin_word_list contained all words" do
      expect(@statistics.__origin_word_list).to_not be_nil
      expect(@statistics.__origin_word_list).to be_a(Hash)
    end

    context "__origin_word_list should be filtered" do
      it "should have a whitelist" do
        expect(@statistics.whitelist).to_not be_nil
      end

      it "should have a word_list contains filtered words" do
        expect(@statistics.word_list).to_not be_nil
        expect(@statistics.word_list).to be_a(Hash)
        expect(@statistics.word_list).to_not eq(@statistics.__origin_word_list)
      end
    end
  end
end
