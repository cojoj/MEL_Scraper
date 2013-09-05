require 'net/http'

# Custom class which is downloading website source and passing it to variable
# We can later use this website content to operate on it

class Downloader
  attr_accessor :content, :website_url
  
  # Initializing objcet with website URL which we want to download
  def initialize(url)
    @website_url = URI(url)
  end
  
  # Downloading source (HTML) of webpage and saving it in content
  def download_page
     @content = Net::HTTP.get(@website_url)
  end
  
end