require 'open-uri'
require 'nokogiri'
require 'mechanize'

class SimpleDesktopCrawler

  $url = "http://simpledesktops.com/browse/"
  $image_folder = File.join(ENV['HOME'],"Projects/image_crawler/data/simple_desktop/")

  def take_everything
    count = 1
    agent = Mechanize.new
    page_number = $url
    error = nil
    until error != nil
      begin
        agent.get(page_number)
      rescue Mechanize::ResponseCodeError => e
        error = e.response_code
      end
      self.browse_page(page_number + count.to_s)      
      count += 1
    end
  end


  def browse_page(page = nil)
    page_url = page if page != nil
    document = Nokogiri::HTML(open(page_url))
    document.search('div.desktop > a').each do |i|
      href = i.attribute('href')
      name = href.to_s.split("/")[-1]
      self.save_wallpaper(href, name)
    end   
  end

  def save_wallpaper(link = nil, name = nil)
    begin
      url = link if link != nil
      filename = name if name != nil
      agent = Mechanize.new
      agent.get(url)
    rescue Mechanize::ResponseCodeError => e
      error = e.response_code
    end

    unless error
      puts "Saved wallpaper #{filename}"
      agent.get(link).save_as($image_folder + "#{filename}")
    end

  end
end