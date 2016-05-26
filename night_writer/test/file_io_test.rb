require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_io'
require 'rake/testtask'

class FileIOTest < Minitest::Test
attr_reader     :file_io

def setup
  @file_io = FileIO.new
end

  def test_filereader_reads_from_reader_file
    assert_equal "dog\n", file_io.read("file_reader_test_text.txt")
  end

  def test_writes_to_braille_file
    file_io.write("file_reader_test_new.txt", file_io.read("file_reader_test_text.txt"))
    assert_equal "dog\n", file_io.read("file_reader_test_text.txt")
  end

end
