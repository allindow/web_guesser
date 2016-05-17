class Round
  attr_reader   :deck,
                :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = 0
    @correct_count = 0

  end

  def current_card
    deck.cards[@current_card]
  end

  def record_guess(response)
      @guesses << Guess.new(response, current_card)
      guess = @guesses.last# @guesses << guess
        if guess.correct?
          @correct_count += 1
        end
      @current_card += 1
      guess
  end

  def number_correct
    @correct_count
  end

  def percent_correct
    (@correct_count.to_f / @guesses.count.to_f) * 100
  end

end
