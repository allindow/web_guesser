require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader'
require './lib/braille_converter'
require './lib/parser'

class ParserTest < Minitest::Test

  def test_can_split_each_braille_char_into_pair_strings_lowercase
    message = BrailleConverter.new
    braille_conversion = message.convert!("me")
    parse = Parser.new
    assert_equal [["00","..","0."],["0.",".0",".."]],parse.braille_split(braille_conversion)
  end

  def test_can_split_each_braille_char_into_pair_strings_uppercase
    skip
    message = BrailleConverter.new
    braille_conversion = message.convert!("Me")
    require "pry"; binding.pry
    parse = Parser.new
    assert_equal [[]]
  end

  def test_line_pairs_can_be_combined_into_one_array
    skip
    parser = Parser.new
    input = [["00","..","0."],["0.",".0",".."],["..","..",".."]]
    require "pry"; binding.pry
    assert_equal [["000..."],["...0.."],["0....."]], parser.line_sets(input)
  end


end
