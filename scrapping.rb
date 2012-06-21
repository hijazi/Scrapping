require 'rubygems'
require 'nokogiri'
require 'open-uri'

#getting web pages links
page1 = Nokogiri::HTML(open('http://www.cbssyr.org/yearbook/2011/chapter12-AR.htm'))
baseUri = "http://www.cbssyr.org/yearbook/2011/"
a = page1.xpath("//table/tr/td/a/@href")

#printing pages links after adding baseURI raw by raw
a.each do |raw|

    print baseUri+raw.to_s+"\n\n"
    
    end

print ("Finished the first page, going to the inner pages :)\n\n\n\n\n\n")

#getting third page just to test the script
innerpage = Nokogiri::HTML(open(baseUri+a[2].to_s), nil, 'Windows-1256')

b = innerpage.xpath("//table/tr")


b.each do |raw|
    c = raw
    d = c.xpath("td[not(name()='span')]")
    d.each do |x|
       outputS = x.text
       print outputS+"$"
    end
    print "\n\n\n\n\n\n\n"
end
