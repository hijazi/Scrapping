Dir.foreach("Data") {|x| 
  if (x!=".") and (x!="..")
  myFile = File.open("Data/"+x)
  myFile.readline
  indecators = myFile.readline.split(",")
  fileArr = []
  a = []
  i=j = 0
  myFile.each {|line| 
    a[i] = line.split(",")
    fileArr[i] = a[i] 
     i += 1
      
    }
   
  j = 1
  while (j < indecators.length) do
  print ("will open file "+j.to_s+"\n")
  wFile = File.new("test/"+indecators[j], "w+")
  wFile.print(indecators[j])
  wFile.print("\n")
  fileArr.each do |line|
    if (!line.empty?)
      wFile.print(line[0])
      wFile.print(",")
      wFile.print(line[j])
      wFile.print("\n")
    end
  end
  print ("Finished file "+j.to_s+"\n")
  j+=1
  end
  end
}