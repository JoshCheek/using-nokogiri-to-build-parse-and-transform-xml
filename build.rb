# XML BUILDING
require 'active_support/time'
Article = Struct.new :id, :title, :body, :created_at

articles = [
  Article.new(1, "First blog!",  "Brown is my favourite colour", 10.days.ago),
  Article.new(2, "Second blog!", "Teachin the humans in DC about Rails", 5.days.ago),
  Article.new(3, "Going to be a long day O.o", "Teaching and flying, 16 hours altogether >.< ...and class tomorrow!", Time.now)
]

require 'nokogiri'
full_host = "http://myblog.com"

builder = Nokogiri::XML::Builder.new do |xml|
  xml.feed do
    xml.title   "Josh's Example Blog"
    xml.updated articles.last.created_at.iso8601
    xml.link    rel: "self", href: "#{full_host}/blog/feed.atom"
    xml.id      "#{full_host}/"

    xml.author do |author|
      author.name   "Josh Cheek"
      author.email  "josh.cheek@gmail.com"
      author.uri    full_host
    end

    articles.each do |article|
      xml.entry do |entry|
        entry.id          "#{full_host}/#{article.id}"
        entry.title       article.title
        entry.published   article.created_at.iso8601
        entry.updated     article.created_at.iso8601
        entry.summary     article.title
        entry.link        href: "#{full_host}/#{article.id}"
        entry.content     article.body, type: 'html'
      end
    end
  end
end

puts builder.to_xml

# >> <?xml version="1.0"?>
# >> <feed>
# >>   <title>Josh's Example Blog</title>
# >>   <updated>2014-06-28T09:11:36-06:00</updated>
# >>   <link rel="self" href="http://myblog.com/blog/feed.atom"/>
# >>   <id>http://myblog.com/</id>
# >>   <author>
# >>     <name>Josh Cheek</name>
# >>     <email>josh.cheek@gmail.com</email>
# >>     <uri>http://myblog.com</uri>
# >>   </author>
# >>   <entry>
# >>     <id>http://myblog.com/1</id>
# >>     <title>First blog!</title>
# >>     <published>2014-06-18T09:11:36-06:00</published>
# >>     <updated>2014-06-18T09:11:36-06:00</updated>
# >>     <summary>First blog!</summary>
# >>     <link href="http://myblog.com/1"/>
# >>     <content type="html">Brown is my favourite colour</content>
# >>   </entry>
# >>   <entry>
# >>     <id>http://myblog.com/2</id>
# >>     <title>Second blog!</title>
# >>     <published>2014-06-23T09:11:36-06:00</published>
# >>     <updated>2014-06-23T09:11:36-06:00</updated>
# >>     <summary>Second blog!</summary>
# >>     <link href="http://myblog.com/2"/>
# >>     <content type="html">Teachin the humans in DC about Rails</content>
# >>   </entry>
# >>   <entry>
# >>     <id>http://myblog.com/3</id>
# >>     <title>Going to be a long day O.o</title>
# >>     <published>2014-06-28T09:11:36-06:00</published>
# >>     <updated>2014-06-28T09:11:36-06:00</updated>
# >>     <summary>Going to be a long day O.o</summary>
# >>     <link href="http://myblog.com/3"/>
# >>     <content type="html">Teaching and flying, 16 hours altogether &gt;.&lt; ...and class tomorrow!</content>
# >>   </entry>
# >> </feed>
