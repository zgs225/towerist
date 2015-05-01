# encoding: utf-8
require 'nokogiri'

module Towerist
  # 用来存放数据源信息
  class DataSource
    # 数据路径
    attr_reader   :data_source_path, :doc

    def initialize(data_source_path)
      @data_source_path = data_source_path
      abort '数据源不存在' unless File.exists?(@data_source_path)
      read_file_as_doc(@data_source_path)
    end

    # 提供数据
    def provide
      @content = @doc.xpath("//div[@class='comment-content editor-style']")
      abort '数据源中不存在数据' if content.empty?
      @content
    end

    private

    def read_file_as_doc(file_path)
      f    = File.open file_path
      @doc = Nokogiri::HTML(f)
      f.close
    end
  end
end
