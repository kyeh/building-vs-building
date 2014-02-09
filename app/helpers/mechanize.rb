# require 'rubygems'
# require 'nokogiri'
# require 'open-uri'

# a = Mechanize.new { |agent|
#   agent.user_agent_alias = 'Mac Safari'
# }
# response = a.get('http://www.google.com/imghp')
# form = response.forms.first
# form_field = form.field_with(name: 'q').value = "sears tower"
# search_result = form.submit

# # p search_result
# # p search_result.uri

# PAGE_URL = 'https://www.google.com/search?site=imghp&tbm=isch&source=hp&biw=916&bih=334&q=sears+tower&oq=sears+tower&gs_l=img.3..0l10.2270081.2271621.0.2271737.11.9.0.2.2.0.121.571.8j1.9.0....0...1ac.1.34.img..0.11.581.teUvWS1tL2E#imgdii=_'
# page = Nokogiri::HTML(open(PAGE_URL))

# p 'A'*50
# p page
# p 'B'*50
# p page.css("div[data-ri='0']")
# p 'C'*50

# search_result.links.each do |link|
#   puts link.text
# end

# p form
# p form_field
# search_result = page.form.field_with(name: 'q') do |search|
  # search.q = "sears tower"
# end.submit

# a.get('http://www.google.com/imghp') do |page|
#   search_result = page.form.field_with(name: 'f') do |search|
#     p search
#     search.q = "sears tower"
#   end.submit
# end


# p search_result

# a.get('http://google.com') do |page|
#   search_result = page.form_with(name: 'f') do |search|
#     search.q = 'Hello world!'
#   end.submit

#   search_result.links.each do |link|
#     puts link.text
#   end
# end