
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require File.expand_path('../config/environment',__FILE__)

p (Building.new().inspect)

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}
response = a.get('http://www.google.com/imghp')
form = response.forms.first
form_field = form.field_with(name: 'q').value = "sears tower"
search_result = form.submit



puts search_result.search(".rg_di").first.children.first.attribute("src")
# p search_result.uri

# PAGE_URL = 'https://www.google.com/search?site=imghp&tbm=isch&source=hp&biw=916&bih=334&q=sears+tower&oq=sears+tower&gs_l=img.3..0l10.2270081.2271621.0.2271737.11.9.0.2.2.0.121.571.8j1.9.0....0...1ac.1.34.img..0.11.581.teUvWS1tL2E#imgdii=_'
# page = Nokogiri::HTML(open(PAGE_URL))

# p 'A'*50
# p page
# p 'B'*50
# p page.css("div[data-ri='0']")
# p 'C'*50