#FileWriter should instantiate with the entire braille string being converted
#then needs to write to the file - write method
class FileWriter
  attr_reader     :parsed_conversion

  def initialize(parsed_conversion)
    @parsed_conversion = parsed_conversion
  end

  def write(new_file = ARGV[1],converted_string)
    File.write(new_file,converted_string)
  end

end
