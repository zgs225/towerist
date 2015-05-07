# encoding: utf-8
require 'fileutils'
require 'csv'

module Towerist
  class Generator
    attr_reader :words

    def initialize(words)
      @words = words
    end

    def generate
      FileUtils.mkdir_p csv_directory unless Dir.exist?(csv_directory)
    end

    def csv_directory
      File.expand_path('../../html/data', File.dirname(__FILE__))
    end
  end
end
