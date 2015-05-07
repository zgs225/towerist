# encoding: utf-8

module Towerist
  class GenderGenerator < Generator
    def generate
      super

      gender_ratio = @words.select { |word, _| word == '男' || word == '女' }
      CSV.open "#{ csv_directory }/sex.csv", 'wb' do |csv|
        csv << gender_ratio.keys
        csv << gender_ratio.values
      end
    end
  end
end
