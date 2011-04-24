require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'mechanize'

class ImageCrawler
  attr_accessor :query, :resolution
  $image_folder = File.join(ENV['HOME'],"Projects/image_crawler/data/")
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
      if file_name != nil && file_url != nil
        self.take_image(file_url, file_name)
      end
    end
  end
  
  def take_image (link, name)
    link = "http://#{link}"
    puts "Saved file #{name} in Data folder."
    agent = Mechanize.new
    agent.get(link).save_as($image_folder + "#{name}")
  end
  
  def filter_resolution
    
  end

end