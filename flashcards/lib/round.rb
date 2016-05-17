class Round
  attr_reader   :deck,
                :guesses

  def initialize(deck)
    @deck = deck
    @guesses = guesses.to_a
    @current_card = 0
  end

  def current_card
    deck.cards[@current_card]
  end

  def record_guess(response)
    @guesses << response
  end

  def feedback
    if round.guesses.first == round.current_card.answer
      "Correct!"
    end
  end
end
#
#
# #round.record_guess("Juneau")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">, @response="Juneau">
# round.guesses.count
