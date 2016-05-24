class FileReader

  def read(filename = ARGV[0])
    File.read(filename).chomp
  end

  def write(new_file = ARGV[1],translation)
    File.write(new_file, translation)
  end



end
