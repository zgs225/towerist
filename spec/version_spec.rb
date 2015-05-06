# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Version" do
  it "should be correct" do
    file = File.expand_path '../../VERSION', __FILE__
    version = File.read(file).strip

    expect(version).to eq Towerist::Version::STRING
  end
end
