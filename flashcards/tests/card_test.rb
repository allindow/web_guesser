require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class CardTest < Minitest::Test

  def test_does_card_exist
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

  def test_does_card_answer_match_question
    card = Card.new("What is the capital of Colorado?", "Denver")
    assert_equal "Denver", card.answer
  end

end
