require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Towerist" do
  before do
    `ruby "#{ root }/bin/towerist"`
  end

  context "work correctly that" do
    it "should generate csv files" do
      files = ['top10', 'data', 'styles', 'sex']
      files.each do |file|
        expect(File.exist?("#{ root }/html/data/#{ file }.csv")).to be true
      end
    end
  end
end
