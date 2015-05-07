# encoding: utf-8
require 'yaml'

module Towerist
  class StyleGenerator < Generator
    def generate
      super

      style_list = get_style_list

      CSV.open "#{ csv_directory }/styles.csv", 'wb' do |csv|
        csv << ['x', '出现次数']
        style_list.sort_by { |_, count| count }.reverse.each do |key, value|
          csv << [key, value]
        end
      end
    end

    private

    def get_style_list
      style_list = Hash.new(0)

      styles = get_styles
      styles.each do |key, array|
        @words.each do |word, count|
          style_list[key] += count if array.include?(word)
        end
      end

      style_list
    end

    def get_styles
      YAML.load_file(File.expand_path('../../../filter.yml', File.dirname(__FILE__)))['styles']
    end
  end
end
