require 'nokogiri'
require 'pp'

class DailyKeywordExtractor
  attr_reader :doc

  def initialize(html_path)
    @html_path = html_path
    @doc = doc_from_html(html_path)
  end

  def doc_from_html(path)
    raise 'パラメータで解析対象のHTMLファイルのパスを指定してください。' unless path
    raise "指定されたパスのファイルが存在しません。[#{path}]" unless File.exist? path
    doc = nil
    File.open(path, 'r:utf-8') do |file|
      doc = Nokogiri::HTML(file)
    end
    doc
  end

  def hot_keywords
    @doc.xpath('//a[@class="hot-title"]').to_a.map{|node| node.inner_text}
  end
end