require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
attr_reader   :card_1,
              :card_2,
              :deck,
              :round
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @deck = Deck.new([card_1, card_2])
    @round = Round.new(deck)
  end

  def test_round_start_with_deck_of_cards
    setup
    assert_equal deck, round.deck
  end

  def test_round_accepts_guesses
    setup
    assert_equal [], round.guesses
  end

  def test_round_can_present_current_card
    setup
    assert_equal card_1, round.current_card
  end

  def test_round_records_guess_as_instance_of_guess_class
    setup
    guess = round.record_guess("Juneau")
    assert_instance_of Guess, guess
  end

  def test_round_records_number_of_guesses
    setup
    round.record_guess("Juneau")
    round.record_guess("Whatever")
    assert_equal 2, round.guesses.count
  end

  def test_answer_is_correct_says_correct
    setup
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_answer_is_incorrect_says_correct
    setup
    round.record_guess("Popcorn")
    assert_equal "Incorrect.", round.guesses.first.feedback
  end

  def test_round_counts_correct_guess
    setup
    round.record_guess("Juneau")
    assert_equal 1, round.number_correct
  end

  def test_round_presents_next_card_in_deck_after_guess_made
    setup
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal card_2, round.current_card
  end

  def test_round_counts_number_of_only_correct_guesses
    setup
    round.record_guess("Juneau")
    round.record_guess("Hamburger")
    assert_equal 1, round.number_correct
  end

  def test_round_tells_you_percent_correct
    setup
    round.record_guess("Juneau")
    guess = round.record_guess("Hamburger")
    assert_equal 50, round.percent_correct
  end
end
