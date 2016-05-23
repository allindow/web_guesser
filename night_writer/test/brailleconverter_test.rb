require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader'
require './lib/filewriter'
require './lib/braille_converter'

class BrailleConverterTest < Minitest::Test

  def test_converts_one_letter_to_braille_string_array
    bc = BrailleConverter.new("a")
    assert_equal ["0.....\n"], bc.convert!
  end

  def test_converts_two_words_with_space_to_string_array
    bc = BrailleConverter.new("to me")
    assert_equal [".0000.\n","0..00.\n","......\n","00..0.\n","0..0..\n"], bc.convert!
  end

  def test_converts_braille_string_to_words
    bc = BrailleConverter.new([".0000.\n","0..00.\n","......\n","00..0.\n","0..0..\n"])
    assert_equal "to me", bc.convert!
  end

end
