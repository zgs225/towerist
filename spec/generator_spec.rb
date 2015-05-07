# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Towerist::Generator do

  before { @generator = Towerist::Generator.new(hello: 1, world: 2) }

  it "should contain a words" do
    expect(@generator.respond_to?(:words)).to be true
  end

  it "words should not be nil" do
    expect(@generator.words).to_not be_nil
  end


  it "shoud respond to generate" do
    expect(@generator.respond_to?(:generate)).to be true
  end
end
