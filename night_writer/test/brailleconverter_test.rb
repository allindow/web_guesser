require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader'
require './lib/braille_converter'

class BrailleConverterTest < Minitest::Test

  def test_converts_one_letter_to_braille
    bc = BrailleConverter.new
    assert_equal ["0....."], bc.convert!("a")
  end

  def test_converts_two_words_with_space_to_braille
    bc = BrailleConverter.new
    assert_equal [".0000.","0..00.","......","00..0.","0..0.."], bc.convert!("to me")
  end

  def test_converts_braille_string_to_words
    bc = BrailleConverter.new
    assert_equal "to me", bc.convert!([".0000.","0..00.","......","00..0.","0..0.."])
  end

  def test_convert_capital_letter_to_braille
    bc = BrailleConverter.new
    assert_equal [".....0","0....."], bc.convert!("A")
  end

  def test_convert_braille_to_capital_letter
    bc = BrailleConverter.new
    assert_equal "A", bc.convert!([".....0","0....."])
  end

  def test_convert_braille_to_capitalized_word
    bc = BrailleConverter.new
    assert_equal "An", bc.convert!([".....0","0.....","00.00."])
  end
end
