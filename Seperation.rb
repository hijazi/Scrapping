class String
 def remove_non_ascii(replacement="") 
   self.gsub(/[\u0080-\u00ff]/,replacement)
 end
end


Dir.foreach("Data") {|x| 
  if (x!=".") and (x!="..")
  myFile = File.open("Data/"+x)
  title = myFile.readline
  indecators = myFile.readline.split(",")
  
  #deleting trailing '\n' char and beginning ' '
  indecators.each { |e| 
    if (e[0]==" ") 
      e = e[1..e.length]
      end
    if (indecators.index(e)==indecators.length-1) and (!e.nil?)
      e.chomp!
    end
       }
  fileArr = []
  a = []
  i=j = 0
  myFile.each {|line|
      if !(line == "\n") 
      a[i] = line.split(",")
      fileArr[i] = a[i] 
       i += 1
       end      
    }
   
  j = 1
  while (j < indecators.length) do
  print ("will open file "+j.to_s+"\n")
  wFile = File.new("test/"+indecators[j], "w+")
  wFile.print(x+"\n")
  wFile.print(indecators[j])
  wFile.print("\n")
  k=0
  fileArr.each do |line|
    k+=1
      #print (line[0]+" "+line[0][0])
      #print(line[0]+" ")
      while (line[0][0]==" ")
       line[0].slice!(0)
      end
      while (line[0][line.length] == " ")
        line[0].chomp!
      end
      next if (line[0][0]=="*")
      line[0] = line[0].remove_non_ascii() if (!line[0].nil?)
      wFile.print(line[0])
      wFile.print(",")
      
      #deleting trailing '\n' char
      if (j==indecators.length-1) and (!line[j].nil?)
        line[j].chomp!
      end
      line[j] = line[j].remove_non_ascii() if (!line[j].nil?)
      wFile.print(line[j])
      if !(k == fileArr.length)
        wFile.print("\n")
      end
  end
  print ("Finished file "+j.to_s+"\n")
  j+=1
  end
  end
}