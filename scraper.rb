require "httparty"
require "nokogiri"

# Fetch the HTML content
response = HTTParty.get("https://www.mediawiki.org/wiki/API:Main_page")

if response.code == 200
  html = response.body
  doc = Nokogiri::HTML(html)

  # Remove unwanted elements
  doc.css('script').remove
  doc.css('footer').remove
  doc.css('.ads').remove
  doc.css('a').remove

  # Extract and print relevant content
  doc.css('p').each do |p|
    puts p.text.strip  # Clean the text and print
  end

  doc.css('li').each do |li|
    puts li.text.strip
  end

  doc.css('dl').each do |dl|
    puts dl.text.strip
  end

  doc.css('dt').each do |dt|
    puts dt.text.strip
  end

  doc.css('dd').each do |dd|
    puts dd.text.strip
  end

  doc.css('tr').each do |tr|
    puts tr.text.strip
  end

  doc.css('td').each do |td|
    puts td.text.strip
  end

  doc.css('th').each do |th|
    puts th.text.strip
  end
else
  puts "Failed to retrieve the page. HTTP Status: #{response.code}"
end
