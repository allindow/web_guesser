require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader.rb'
require './lib/nightwriter.rb'

class NightWriterTest < Minitest::Test

  def test_encode_to_braille
    skip
    nightwriter = NightWriter.new
    assert_equal "dog", nightwriter.encode_to_braille
  end

  def test_write_contents_to_new_file
    skip
    original_file = NightWriter.new
    reader = original_file.file_reader
    assert_equal "hello world\n", reader.write
  end

end
