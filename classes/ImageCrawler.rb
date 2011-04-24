require 'nokogiri'
require 'open-uri'

class ImageCrawler
  attr_accessor :query, :resolution
  $google_url = "http://www.google.com.br/images?hl=pt-BR&source=hp&q="
  
  def initialize(query, resolution)
    @query = query
    @resolution = resolution
  end

  def do_search
    image_url = $google_url + self.query
    open(image_url) do |f|
      f.each do |line|
        print "#{line}"
      end
    end
  end
  
  
  def filter_resolution
    
  end

end