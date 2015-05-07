# encoding: utf-8

module Towerist
  # 用来生成所有类别的数据
  class ScatterGenerator < Generator
    def generate
      super

      CSV.open "#{ csv_directory }/data.csv", 'wb' do |csv|
        csv << ['x', '出现次数']
        @words.each { |record| csv << record }
      end
    end
  end
end
