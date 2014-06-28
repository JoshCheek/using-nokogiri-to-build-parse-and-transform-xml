require 'nokogiri'

file    = File.read(File.expand_path '../feed.xml', __FILE__)
doc     = Nokogiri::XML(file)

entries = doc.xpath('//feed/entry')
             .each_with_object(Hash.new) { |node, entries|
               link          = node.at_xpath('./link')['href']
               title         = node.at_xpath('./title').text
               entries[link] = title
             }

entries.each do |link, title|
  puts "#{link} #{title}"
end

# >> http://myblog.com/1 First blog!
# >> http://myblog.com/2 Second blog!
# >> http://myblog.com/3 Going to be a long day O.o
