require_relative 'sources/Downloader'

# Scraper implementation

test = Downloader.new('http://www.rubyist.net/~slagell/ruby/objinitialization.html')
test.download_page

puts test.content