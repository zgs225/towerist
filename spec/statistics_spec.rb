# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Towerist::Statistics do

  before do
    @data_source = generate_data_source
    @statistics  = Towerist::Statistics.new @data_source
  end

  context "text from data source should be segmented" do
    it "should have a __origin_word_list contains all words" do
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

  context "has many generators" do
    it "should have a generators variable" do
      expect(@statistics.generators).to_not be_nil
    end

    it "variable generators shoud be an array" do
      expect(@statistics.generators).to be_a(Array)
    end

    it "variable generators should be empty while initialize" do
      expect(@statistics.generators.length).to eq(0)
    end

    context "add generator to generators" do
      before { @statistics.add_generator(Towerist::Generator.new({})) }

      it "should can add a generator to generators" do
        expect do
          @statistics.add_generator(Towerist::Generator.new({}))
        end.to change { @statistics.generators.length }.by(1)
      end

      it "shoud can add an array of generators into generators" do
        expect do
          @statistics.add_generators([Towerist::Generator.new({}), Towerist::Generator.new({})])
        end.to change { @statistics.generators.length }.by(2)
      end

      it "element of generators shoud be instance of Towerist::Generator" do
        expect(@statistics.generators.first).to be_a(Towerist::Generator)
      end

      it "should have method start to active all generators" do
        expect(@statistics.respond_to?(:start)).to be true
      end
    end
  end
end
