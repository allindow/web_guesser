require 'minitest/autorun'
require 'minitest/pride'
require 'rake/testtask'
require './lib/braille_converter'
require './lib/parser'

class ParserTest < Minitest::Test

  def test_can_split_each_braille_char_into_line_arrays_lowercase
    message = BrailleConverter.new
    braille_conversion = message.convert!("me")
    parse = Parser.new
    assert_equal ["000.", "...0", "0..."],parse.braille_lines(braille_conversion)
  end

  def test_can_split_each_braille_char_into_line_arrays_with_uppercase
    message = BrailleConverter.new
    braille_conversion = message.convert!("Me")
    parse = Parser.new
    assert_equal ["..000.",".....0",".00..."], parse.braille_lines(braille_conversion)
  end

  def test_can_split_each_braille_char_into_line_arrays_with_mix_of_characters
    message = BrailleConverter.new
    braille_conversion = message.convert!("Me 2!")
    parse = Parser.new
    assert_equal ["..000....00...",".....0...00.00",".00.........0."], parse.braille_lines(braille_conversion)
  end

  def test_can_take_file_lines_and_parse_to_braille_character_strings
    parse = Parser.new
    assert_equal [".....0", "00..0.", "0..0..", "......", ".0.0..", "0.0...", "..000."], parse.braille_characters("..000....00...\n.....0...00.00\n.00.........0.")
  end

end
