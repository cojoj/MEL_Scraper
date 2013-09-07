require_relative 'sources/Downloader'
require 'nokogiri'

# Scraper implementation

html_content = Downloader.download_page('http://www.s-techent.com/ATA100.htm')
parsed_html = Nokogiri::HTML(html_content)

# Getting whole table with MMELs
tmp = parsed_html.css("table")[1].css("tr")

puts tmp[6].text