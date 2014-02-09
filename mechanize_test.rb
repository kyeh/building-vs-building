
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require File.expand_path('../config/environment',__FILE__)

aFile = File.new('building_urls.csv', 'w')

Building.all.each do |building|
  a = Mechanize.new { |agent|
    agent.user_agent_alias = 'Mac Safari'
  }
  response = a.get('http://www.google.com/imghp')

  form = response.forms.first
  form_field = form.field_with(name: 'q').value = building.name
  search_result = form.submit

  # building_url = search_result.search(".rg_di").first.children.first.attribute("src")

  # unless building_url
    building_url = search_result.search(".rg_di").first.children.first.search("img").attribute("src")
  # end

  new_string = "\"#{building.name}\"".concat(",#{building_url}").concat("\n")

  print new_string
  aFile.syswrite(new_string)
end
aFile.close
