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
fW = File.new("test2","w+")
b = innerpage.xpath("//table/tr")
pCells = []
i = 0
b.each { |line| pCells[i] = line.xpath("td");i+=1 }
pCells.each { |e| puts e }
  #e.each { |d| element = d.text; fW.print(element) ;print"$"} ;fW.print"#"}

=begin
i=6
j=k=0
prevC = b[5].xpath("td")
numOfCells = prevC.length
while k < numOfCells
  i=6
 while i < b.length-1
   c = b[i].xpath("td")
   if (!c[k].nil?)
     if (i==6)
       if (k!=0)
       if (!prevC[k+1].nil?)
        print prevC[k+1].text
        print (",")
        print c[k].text
        end
        end
     else
       print c[k].text
     end
    print(",")
    end
   i+=1
 end
 print "\n"
  k+=1
end
b.each do |raw|
    c = raw
    d = c.xpath("td[not(name()='span')]")
    d.each do |x|
        if (!x.text.empty?) and (d.index(x)!=(d.length-1))
           outputS = x.text
           print outputS
           if d.index(x)!=(d.length-2)
               print ","
               end
           end
    end
    print "\n"

end
=end
