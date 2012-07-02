require 'rubygems'
require 'nokogiri'
require 'open-uri'

#getting web pages links
sYear = 2008
while (sYear>2006)
  sYear-=1
  print "started with year: #{sYear}\n"
  Dir.mkdir(sYear.to_s)
  page1 = Nokogiri::HTML(open("http://www.cbssyr.org/yearbook/2007/SYR-2007-AR.htm"))
  print "got #{sYear} link\n"
  baseUri = "http://www.cbssyr.org/yearbook/#{sYear}/"
  a = page1.xpath("//table/tr/td/a/@href")
  #printing pages links after adding baseURI raw by raw
  p a
  a.each do |raw|

    print baseUri+raw.to_s+"\n\n"
    
  end
  
  #getting inner pages
  uNum = 1
  while (uNum < a.length)
    if (!open(baseUri+a[uNum].to_s).nil?)
      innerpage = Nokogiri::HTML(open(baseUri+a[uNum].to_s), nil, 'Windows-1256')
      print "got page #{uNum}\n"
      outFile = File.new(sYear.to_s+"/"+sYear.to_s+","+uNum.to_s,"w+")
      b = innerpage.xpath("//table/tr")
      
      
      b.each do |raw|
          c = raw
          d = c.xpath("td[not(name()='span')]")
          d.each do |x|
              if (!x.text.empty?) and (d.index(x)!=(d.length-1))
                 outputS = x.text
                 outFile.print outputS
                 if d.index(x)!=(d.length-2)
                     outFile.print ","
                 end
              end
          end
          outFile.print "\n"
      end
    end
    uNum+=1
  end

end
