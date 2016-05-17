require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test

  def test_if_guess_is_correct_say_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal card, guess.card
    assert guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_if_guess_is_not_correct_say_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal card, guess.card
    assert_equal "Saturn", guess.response
    refute guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end

end
