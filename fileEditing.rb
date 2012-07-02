def removeBeginSpace(filePath)
  t_file = File.open('tempF','w+')
File.open("filePath", 'r') do |f|
  f.each_line do |line|
    #put text in string to edit it
    tempS = line
    while (tempS[0] == " ")
      tempS.slice!(0)
    end
    t_file.print(tempS)
  end
end

end