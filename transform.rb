require 'nokogiri'

file = File.read(File.expand_path '../feed.xml', __FILE__)
doc  = Nokogiri::XML(file)
xslt = Nokogiri::XSLT(<<XSLT)
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head><title>XSL Transform Example</title></head>
      <body>
        <h1>Article Titles</h1>
        <ul><xsl:apply-templates select="/feed/entry/title"/></ul>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="title">
    <li><xsl:value-of select="."/></li>
  </xsl:template>
</xsl:stylesheet>
XSLT

transformed_document = xslt.transform(doc)
puts transformed_document.to_xml


# >> <html>
# >> <head><title>XSL Transform Example</title></head>
# >> <body>
# >> <h1>Article Titles</h1>
# >> <ul>
# >> <li>First blog!</li>
# >> <li>Second blog!</li>
# >> <li>Going to be a long day O.o</li>
# >> </ul>
# >> </body>
# >> </html>
