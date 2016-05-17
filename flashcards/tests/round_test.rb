require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def test_does_round_start_with_deck_of_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
  end

  def test_if_round_accepts_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_if_round_can_present_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_if_round_records_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    require "pry"; binding.pry
    assert_equal round.guesses, round.record_guess("Juneau")
    # line above is not correct. round.guesses is just an array of strings, but we want it to return the object guesses with the object card...
  end

  # def test_if_round_records_number_of_guesses
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   assert_equal round.guesses, round.record_guess("Juneau")
  #   assert_equal 1, round.guesses.count
  # end
  #
  # def test_if_answer_is_correct_says_correct
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   assert_equal round.guesses, round.record_guess("Juneau")
  #   require "pry"; binding.pry
  #   assert_equal "Correct!", round.guesses.first.feedback
  # end

end
