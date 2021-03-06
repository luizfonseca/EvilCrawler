require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'mechanize'

class GoogleImageCrawler
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
    begin
      link = "http://#{link}"
      agent = Mechanize.new
      agent.get(link)
    rescue Mechanize::ResponseCodeError => e
      error = e.response_code.to_i
    end
    unless error
      created_at = Time.now.strftime("%Y-%m-%d_%H%M%S")
      puts "Saved file #{name} in Data folder."
      agent.get(link).save_as($image_folder + created_at + "#{name}")
    end 
  end
  
  def filter_resolution
    
  end

end