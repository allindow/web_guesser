require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader'
require 'rake/testtask'

class FileReaderTest < Minitest::Test

  def test_filereader_reads_from_reader_file
    file_reader = FileReader.new
    assert_equal "dog\n", file_reader.read("file_reader_test_text.txt")
  end

  def test_writes_to_braille_file
    file_reader = FileReader.new
    file_reader.write("file_reader_test_new.txt", file_reader.read("file_reader_test_text.txt"))
    assert_equal "dog\n", file_reader.read("file_reader_test_text.txt")
  end

end
