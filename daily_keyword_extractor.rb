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
    text = File.read(path, encoding: Encoding::EUC_JP).encode(Encoding::UTF_8, invalid: :replace)
    Nokogiri::HTML(text)
  end

  def hot_keywords
    @doc.xpath('//a[@class="hot-title"]').to_a.map{|node| node.inner_text}
  end
end