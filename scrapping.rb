require 'rubygems'
require 'nokogiri'
require 'open-uri'

#getting web pages links
page1 = Nokogiri::HTML(open('http://www.cbssyr.org/yearbook/2011/chapter12-AR.htm'))
baseUri = "http://www.cbssyr.org/yearbook/2011/"
a = page1.xpath("//table/tr/td/a/@href")
=begin
#printing pages links after adding baseURI raw by raw
a.each do |raw|

    print baseUri+raw.to_s+"\n\n"
    
    end
=end

#getting a page just to test the script
innerpage = Nokogiri::HTML(open(baseUri+a[13].to_s), nil, 'Windows-1256')

b = innerpage.xpath("//table/tr")

throwAway = 0
b.each do |raw|
    c = raw
    d = c.xpath("td[not(name()='span')]")
    d.each do |x|
      #printing without the last cell
      if (x.text.include "Damascus")
        throwAway = 1
      end
        if (!x.text.empty?) and (d.index(x)!=(d.length-throwAway))
           outputS = x.text
           print outputS
           if d.index(x)!=(d.length-2)
               print ","
               end
           end
    end
    print "\n"
end
