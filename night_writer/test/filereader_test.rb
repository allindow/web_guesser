require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader'
require 'rake/testtask'

class FileReaderTest < Minitest::Test

  def test_filereader_reads_from_reader_file
    file_reader = FileReader.new
    assert_equal "dog\n", file_reader.read("message.txt")
  end

end
