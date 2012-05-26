require 'rubygems'
require 'nokogiri'
require 'open-uri'

page1 = Nokogiri::HTML(open('http://www.cbssyr.org/yearbook/2011/chapter12-AR.htm'))
#a = page1.xpath("/html/body/table").text
baseUri = "http://www.cbssyr.org/yearbook/2011/"
a = page1.xpath("//table/tr/td/a/@href")


a.each do |raw|

    print baseUri+raw.to_s+"\n\n"
    
    end

print ("Finished the first page, going to the inner pages :)\n\n\n\n\n\n")


innerpage = Nokogiri::HTML(open(baseUri+a[2].to_s), nil, 'Windows-1256')

b = innerpage.xpath("//table/tr")


b.each do |raw|
    c = raw
    d = c.xpath("td[not(name()='span')]")
    d.each do |x|
       outputS = x.text
       print outputS+" "
=begin
        if outputS.to_s["<span"]
            if outputS.to_s.index("<span") != 0
             print ("\n\n\n\n"+outputS.to_s.index("<span").to_s+ "first char is"+outputS[0].to_s+"\n"+outputS.to_s[0..outputS.to_s.index("<span")-1]+"\n\n\n\n\n\n")  
             end
            else
            print outputS+" "
        
            end      
=end
    end
    print "\n\n\n\n\n\n\n"
end
