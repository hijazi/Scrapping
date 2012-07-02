Dir.foreach("Data") {|x|
  if (x!=".") and (x!="..")
    print x+"\n"
    f = File.open("Data/"+x)
    print (f.readline+"\n")
    print(f.readline+"\n")
  end
  }
