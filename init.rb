#!/usr/bin/env ruby
#require './classes/google_image_crawler.rb'
require './classes/simple_desktop_crawler.rb'

#image = GoogleImageCrawler.new("term+of+search","1000x+")
#image.do_search

image = SimpleDesktopCrawler.new
image.take_everything