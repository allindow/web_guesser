#FileWriter should instantiate with the entire braille string being converted
#then needs to write to the file - write method
class FileWriter

  def write(new_file = ARGV[1],converted_string)
    File.write(new_file,converted_string)
  end

end
