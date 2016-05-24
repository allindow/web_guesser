require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader'
require 'rake/testtask'

class FileReaderTest < Minitest::Test

  def test_filereader_reads_from_reader_file
    file_reader = FileReader.new
    assert_equal "dog", file_reader.read("filereader_test_text")
  end

  def test_writes_to_braille_file
    file_reader = FileReader.new
    file_reader.write("filereader_test_new.txt", file_reader.read("filereader_test_text"))
    assert_equal "dog", file_reader.read("filereader_test_text")
  end

end
