#!/usr/bin/env ruby
#require './classes/GoogleImageCrawler.rb'
require './classes/SimpleDesktopCrawler.rb'

#image = GoogleImageCrawler.new("term+of+search","1000x+")
#image.do_search

image = SimpleDesktopCrawler.new
image.take_everything