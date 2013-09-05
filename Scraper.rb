require_relative 'sources/Downloader'
require 'nokogiri'

# Scraper implementation

html_content = Downloader.download_page('http://www.s-techent.com/ATA100.htm')
parsed_html = Nokogiri::HTML(html_content)

parsed_html.xpath('/html/body').each do |x|
  puts x.path
end
