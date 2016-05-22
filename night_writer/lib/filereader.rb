class FileReader

  def read(filename = ARGV[0])
  #   # filename = "message.txt"
  #   # #replace hardcoded file with ARGV[0]
    File.read(filename)
  end

end
