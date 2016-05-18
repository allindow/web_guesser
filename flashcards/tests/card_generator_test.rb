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

def test_card_generator_loads_cards
  file = CardGenerator.new("cards.txt")
  cards = file.cards
  assert_equal Array, cards.class
  assert_equal Card, cards.first.class
end

  def test_can_read_lines_in_file
    cards = CardGenerator.new("card.txt").cards
    assert_instance_of Card, cards[0]
  end
end
