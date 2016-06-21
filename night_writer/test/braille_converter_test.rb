require 'minitest/autorun'
require 'minitest/pride'
require 'rake/testtask'
require './lib/braille_converter'

class BrailleConverterTest < Minitest::Test
  attr_reader :converter

  def setup
    @converter = BrailleConverter.new
  end

  def test_text_to_braille_one_letter
    assert_equal ["0....."], converter.text_to_braille("a")
  end

  def test_convert_method_one_letter_to_braille
    assert_equal ["0....."], converter.convert!("a")
  end

  def test_text_to_braille_with_2_letters
    assert_equal ["0.....", "0.0..."], converter.text_to_braille("ab")
  end

  def test_converts_two_words_with_space_to_braille
    assert_equal [".0000.","0..00.","......","00..0.","0..0.."], converter.convert!("to me")
  end

  def test_braille_to_text_with_braille_characters
    assert_equal "to me", converter.braille_to_text([".0000.","0..00.","......","00..0.","0..0.."])
  end

  def test_convert_method_braille_string_to_words
    assert_equal "to me", converter.convert!([".0000.","0..00.","......","00..0.","0..0.."])
  end

  def test_capital_letter_to_braille
    assert_equal [".....0","0....."], converter.text_to_braille("A")
  end

  def test_convert_braille_to_capital_letter
    assert_equal "A", converter.braille_to_text([".....0","0....."])
  end

  def test_convert_braille_to_capitalized_word
    assert_equal "An", converter.convert!([".....0","0.....","00.00."])
  end

  def test_convert_number_to_braille
    assert_equal ["......",".0.0..","0.0..."], converter.convert!(" 2")
  end

  def test_braille_to_number
    assert_equal " 2", converter.braille_to_text(["......",".0.0..","0.0..."])
  end

  def test_mix_of_letters_and_numbers_to_braille
    assert_equal ["......",".0.0..","0.0...","......","00..0.","0..0.."], converter.text_to_braille(" 2 me")
  end

  def test_braille_to_mix_of_letters_and_numbers
    assert_equal " 2 me", converter.braille_to_text(["......",".0.0..","0.0...","......","00..0.","0..0.."])
  end

  def test_mix_of_double_digit_numbers_and_letters

      assert_equal [".....0","0.....","......",".0.0..","0.0...","00.0..","......","0.0.0."], converter.text_to_braille("A 24 l")
  end

  def test_mix_of_double_digit_numbers_and_letters

      assert_equal "A 24 l", converter.braille_to_text([".....0","0.....","......",".0.0..","0.0...","00.0..","......","0.0.0."])
  end

  def test_variety_of_characters_from_text_to_braille
    assert_equal ["......", "....0.", ".....0", "0.....", "00.00.", "0000..", "....0.", "......", ".0.0..", "0.....", ".00...", "0.00..", "0000..", "......",".....0","0...00","00..0.","..000.", "......"], converter.text_to_braille(" 'Ang' 1987 Um! ")
  end

  def test_variety_of_characters_from_braille_to_text
    assert_equal " 'Ang' 1987 Um! ", converter.braille_to_text(["......", "....0.", ".....0", "0.....", "00.00.", "0000..", "....0.", "......", ".0.0..", "0.....", ".00...", "0.00..", "0000..", "......",".....0","0...00","00..0.","..000.", "......"])
  end

  def test_convert_method_braille_variety_to_text
    assert_equal " 'Ang' 1987 Um! ", converter.convert!(["......", "....0.", ".....0", "0.....", "00.00.", "0000..", "....0.", "......", ".0.0..", "0.....", ".00...", "0.00..", "0000..", "......",".....0","0...00","00..0.","..000.", "......"])
  end

  def test_convert_method_text_variety
    assert_equal ["......", "....0.", ".....0", "0.....", "00.00.", "0000..", "....0.", "......", ".0.0..", "0.....", ".00...", "0.00..", "0000..", "......",".....0","0...00","00..0.","..000.", "......"], converter.convert!(" 'Ang' 1987 Um! ")
  end

  def test_multiple_numbers_text_to_braille
    assert_equal [".....0", "0.00..", "0..0..", "00.000", "..0...", "......", ".0.0..", "0.....", ".00...", "0.00..", "0000..", "......", "00.00.", "0..00.", "......", ".0.0..", "0.....","0.0...","00....", "0.0...","0000..", "......", "00.000", ".....0", "0..0..", "0.....", "0.00..", "..000."], converter.text_to_braille("Hey, 1987 no 12327 yEah!")
  end

  def test_max_digit_numbers_text_to_braille
    assert_equal [".....0", "00.00.", "0..00.", "......", ".0.0..", "0.....", "0.0...", "00....", "0.0...", "0000..", "......", "00.000", ".....0", "0..0..", "0.....", "0.00..", "..000."], converter.text_to_braille("No 12327 yEah!")
  end

  def test_max_digit_numbers_braille_to_text
    assert_equal "No 12327 yEah!", converter.convert!([".....0", "00.00.", "0..00.", "......", ".0.0..", "0.....", "0.0...", "00....", "0.0...", "0000..", "......", "00.000", ".....0", "0..0..", "0.....", "0.00..", "..000."])
  end

end
