require 'open-uri'

class ImageCrawler
  attr_accessor :query, :resolution
  @google_url = "http://www.google.com.br/images?q=runeroniek"
  
  def initialize(query, resolution)
    @query = query
    @resolution = resolution
  end

  def do_search
    open('http://www.google.com.br/images?q=runeroniek') do |f|
      f.each do |line|
        print "#{line}"
      end
    end
  end
  
  
  def filter_resolution
    
  end

end