require_relative '../daily_keyword_extractor'

describe 'DailyKeywordExtractor' do
  TEST_HTML_PATH = 'spec/はてなキーワード2015-02-11.html'
  let(:extractor){DailyKeywordExtractor.new(TEST_HTML_PATH)}
  describe '初期化' do
    it 'should be a valid object' do
      expect(extractor).not_to be nil
    end
    it 'has a parsed doc' do
      extractor.doc.tap do |doc|
        expect(doc).not_to be nil
        expect(doc).to be_a Nokogiri::HTML::Document
      end
    end
  end
  describe 'hot_keywords' do
    it '20個のホットキーワードを返す' do
      extractor.hot_keywords.tap do |words|
        expect(words).to be_an Array
        expect(words.size).to be 20
      end
    end
  end

end