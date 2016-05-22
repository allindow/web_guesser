
require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader.rb'
require './lib/filewriter.rb'

class FileWriterTest < Minitest::Test

  def test_filewriter_writes_to_braille_file
    file_reader = FileReader.new
    conversion = FileWriter.new
    conversion.write("braille.txt", file_reader.read("message.txt"))
    assert_equal "dog\n", file_reader.read("braille.txt")
  end

end
