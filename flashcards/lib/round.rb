class Round
  attr_reader   :deck,
                :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = 0
    @correct_count = 0
  end

  def pause
    sleep 1
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

  def start
    time = Time.new
    results = File.open("results #{time}","w")
    puts "\n\n"
    results.puts "\n""\n"
    card_number = 1
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-----------------------------------------\n\n"
    pause
    until card_number > deck.count do
      puts "This is card number #{card_number} out of #{deck.count}"
      results.puts "This is card number #{card_number} out of #{deck.count}"
      puts "Question: #{current_card.question}\n\n"
      results.puts "Question: #{current_card.question}\n\n"
      results.puts "Answer: #{current_card.answer}\n\n"
      response = STDIN.gets.chomp()
      results.puts "Response: #{response}"
      guess = record_guess(response)
      puts guess.feedback
      results.puts guess.feedback
      card_number += 1
      pause
      puts "\n\n"
    end
      puts "****** Game over! ******"
      puts "You had #{number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}%.\n\n"
      results.puts "You had #{number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}%.\n\n"
      results.close
  end

end
