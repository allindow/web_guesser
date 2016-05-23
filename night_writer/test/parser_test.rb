require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader'
require './lib/filewriter'
require './lib/braille_converter'
require './lib/parser'

class ParserTest < Minitest::Test

  def test_can_parse_one_braille_character_into_3_arrays
    b_string = Parser.new("0.....")
    assert_equal [["0."],[".."],[".."]], b_string.braille_array_parser
  end

  def test_can_parse_multiple_braille_characters_into_3_arrays_each
    skip
  end

  def test_can_parse_onto_separate_lines_of_txt_file
    b_string = Parser.new("0.....")
    # parsed_b = b_string.braille_array_parser
    # require "pry"; binding.pry
    assert_equal "0.\n..\n..\n", line_parser(parsed_b)
  end

end
