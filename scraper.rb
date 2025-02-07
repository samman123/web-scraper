require "httparty"
require "nokogiri"
require "json"
require "csv"

# Fetch the HTML content
response = HTTParty.get("https://en.wikipedia.org/api/rest_v1/page/random/html")

if response.code == 200
  html = response.body
  doc = Nokogiri::HTML(html)

  # Remove unwanted elements
  doc.css('script').remove
  doc.css('footer').remove
  doc.css('.ads').remove

  description = []

  # Extract content from <p> tags
  doc.css('p').each do |p|
    description << p.text.strip  # Add the clean text to the description array
  end
  
  # Extract content from <li> tags
  doc.css('li').each do |li|
    description << li.text.strip
  end
  
  # Extract content from <dl> tags
  doc.css('dl').each do |dl|
    description << dl.text.strip
  end
  
  # Extract content from <dt> tags
  doc.css('dt').each do |dt|
    description << dt.text.strip
  end
  
  # Extract content from <dd> tags
  doc.css('dd').each do |dd|
    description << dd.text.strip
  end
  
  # Extract content from <tr> tags
  doc.css('tr').each do |tr|
    description << tr.text.strip
  end
  
  # Extract content from <td> tags
  doc.css('td').each do |td|
    description << td.text.strip
  end
  
  # Extract content from <th> tags
  doc.css('th').each do |th|
    description << th.text.strip
  end
  
  # Now, print the description
  description.each do |line|
    puts line
  end
  

CSV.open('data.csv', "w") do |csv|
    description.each do |line|
        csv << [line]
    end
end

else
    puts "Failed to retrieve the page. HTTP status: #{respone.code}"
end
