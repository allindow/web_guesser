require 'minitest/autorun'
require 'minitest/pride'
require 'rake/testtask'
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

  def test_convert_number_to_braille
    bc = BrailleConverter.new
    assert_equal [".0.0..","0.0..."], bc.convert!("2")
  end

  def test_convert_braille_to_number
    bc = BrailleConverter.new
    assert_equal "2", bc.convert!([".0.0..","0.0..."])
  end

  def test_convert_mix_of_letters_and_numbers_to_braille
    bc = BrailleConverter.new
    assert_equal ["......",".0.0..","0.0...","......","00..0.","0..0.."], bc.convert!(" 2 me")
  end

  def test_convert_braille_to_mix_of_letters_and_numbers
    bc = BrailleConverter.new
    assert_equal " 2 me", bc.convert!(["......",".0.0..","0.0...","......","00..0.","0..0.."])
  end

    def test_convert_mix_of_double_digit_numbers_and_letters
      bc = BrailleConverter.new
      assert_equal [".....0","0.....","......",".0.0..","0.0...","00.0..","......","0.0.0."], bc.convert!("A 24 l")
    end

    def test_convert_mix_of_double_digit_numbers_and_letters
      bc = BrailleConverter.new
      assert_equal "A 24 l", bc.convert!([".....0","0.....","......",".0.0..","0.0...","00.0..","......","0.0.0."])
    end

end
