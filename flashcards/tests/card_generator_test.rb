require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_card_generator_exists
    assert CardGenerator.new(nil)
  end

  def test_card_generator_pulls_txt_into_card_objects
    cards = CardGenerator.new("cards.txt").cards
    assert_instance_of Card, cards[0]
  end

  def test_card_contains_question
    cards = CardGenerator.new("cards.txt").cards
    assert_equal "What is 5 + 5?", cards[0].question
  end

end
