require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader.rb'
require './lib/nightwriter.rb'
require './lib/braille_converter'
require './lib/parser'

class NightWriterTest < Minitest::Test

  def test_encode_to_braille
    nightwriter = NightWriter.new
    assert_equal [["00", "..", "0."], ["0.", ".0", ".."]], nightwriter.encode_to_braille("me")
  end

  def test_encode_file_to_braille
    skip
  end
end
