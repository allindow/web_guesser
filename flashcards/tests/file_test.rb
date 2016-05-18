require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/file'

class FUserFileTest < Minitest::Test

  def test_userfile_class_exists
    file = UserFile.new("angelas_cards.txt")
    assert_instance_of UserFile, file
  end

  def test_userfile_takes_a_file
    file = UserFile.new("angelas_cards.txt")
    assert_equal "angelas_cards.txt", file.name
  end

end
