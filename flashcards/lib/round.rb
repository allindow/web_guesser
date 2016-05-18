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
    guess = @guesses.last
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
    ((@correct_count.to_f / @guesses.count.to_f) * 100).to_i
  end

  def end_round
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}%."
  end

  def start
    card_number = 1
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-----------------------------------------"

    until card_number > deck.count do
      puts "This is card number #{card_number} out of #{deck.count}"
      puts "Question: #{current_card.question}"
      response = STDIN.gets.chomp()
      guess = record_guess(response)
      puts guess.feedback
      card_number += 1
    end
    end_round
  end

end
