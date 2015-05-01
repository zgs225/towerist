# encoding: utf-8
require 'data_source'
require 'cseg'

module Towerist
  class Statistics
    attr_reader   :word_list
    # Towerist::DataSource
    attr_accessor :data_source

    def initialize(data_source)
      @data_source = data_source
    end

    # 进行分词
    def segment
      # Cache result
      return @word_list if @word_list
      @word_list = Hash.new(0)
      data.each do |comment|
        words = Kurumi.segment(comment.text.chomp.strip).compact
        words.each { |word| word_list[word] += 1 }
      end
    end

    private

    def data
      @data ||= @data_source.provide
    end
  end
end
