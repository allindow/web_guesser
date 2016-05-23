require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader'
require './lib/filewriter'
require './lib/braille_converter'
require './lib/parser'

class ParserTest < Minitest::Test

  def test_can_parse_one_braille_character_into_3_arrays
    conversion = Parser.new("0.....\n")
    assert_equal [["0."],[".."],[".."]], conversion.braille_array_parser
  end

end
