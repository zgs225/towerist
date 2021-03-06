# encoding: utf-8
require 'cseg'
require 'yaml'

module Towerist
  class Statistics
    attr_reader :word_list, :__origin_word_list, :whitelist
    attr_reader :generators

    def initialize(data_source)
      @data_source = data_source
      @generators  = []
      segment
    end

    # 进行分词
    def segment
      # Cache result
      return @__origin_word_list if @__origin_word_list

      @__origin_word_list = Hash.new(0)
      data.each do |comment|
        words = Kurumi.segment(comment.text.chomp.strip).compact
        words.each { |word| @__origin_word_list[word] += 1 }
      end

      @__origin_word_list
    end
    alias_method :__origin_word_list, :segment

    # 获取分词白名单
    def whitelist
      filter['whitelist']
    end

    # 获取白名单中的分词
    def word_list
      @word_list ||= @__origin_word_list.reject { |word| !whitelist.include?(word) }
    end

    # 向生成器数组中添加生成器
    def add_generator(*generators)
      (@generators << generators).flatten!
    end
    alias_method :add_generators, :add_generator

    # 执行所有的 generators
    def start
      @generators.each do |generator|
        generator.generate
      end
      yield if block_given?
    end

    private

    def data
      @data ||= @data_source.provide
    end

    def filter
      @filter ||= YAML.load_file(File.expand_path('../../filter.yml', File.dirname(__FILE__)))
    end
  end
end
