require 'net/http'

# Custom class which is downloading website source and passing it to variable
# We can later use this website content to operate on it

class Downloader
  
  # Downloading source (HTML) of webpage and saving it in content
  def self.download_page(url)
    puts "Downloading source from: #{url}"
    content = Net::HTTP.get(URI(url))
    return content
  end
  
end