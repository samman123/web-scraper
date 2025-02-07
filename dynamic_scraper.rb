require 'net/http'
require 'uri'
require 'nokogiri'

url = URI('https://brandonvalley.k12.sd.us/bvhs/')
response = Net::HTTP.get(url)

doc = Nokogiri::HTML(response)

doc.css('script').remove
doc.css('footer').remove
doc.css('.ads').remove


doc.css('p').each do |p|
  puts p.text.strip  
end

# Extract content from <li> tags
doc.css('li').each do |li|
  puts li.text.strip
end

# Extract content from <li> tags
doc.css('ul').each do |ul|
  puts ul.text.strip
end

# Extract content from <dl> tags
doc.css('dl').each do |dl|
  puts dl.text.strip
end

# Extract content from <dt> tags
doc.css('dt').each do |dt|
  puts dt.text.strip
end

# Extract content from <dd> tags
doc.css('dd').each do |dd|
  puts dd.text.strip
end



