require 'nokogiri'
require 'open-uri'
require 'net/http'

class ImageCrawler
  attr_accessor :query, :resolution
  $google_url = "http://www.google.com.br/images?hl=pt-BR&source=hp&q="
  
  def initialize(query, resolution)
    @query = query
    @resolution = resolution
  end

  def do_search
    image_url = $google_url + self.query
    document = Nokogiri::HTML(open(image_url))
    document.search('img').each do |i|
      src = i.attribute('src')
      file_url = src.to_s.split('http://')[2]
      file_name = file_url.to_s.split('/')[-1]
      self.take_image(file_url, file_name)
    end
  end
  
  
  def take_image (link, name)
    u = Net::HTTP.start(link.to_s.split('/')[0][1])
    response, data = u.get(link)
    if resp.message == "OK"
      File.open(name, 'wb+') do |f|
        f << data
      end
    end     
  end
  
  def filter_resolution
    
  end

end