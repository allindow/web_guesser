require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)

card_number = round.current_card_number

puts "Welcome! You're playing with #{deck.count} cards."
puts "-----------------------------------------"
until card_number > deck.count do
puts "This is card number #{card_number} out of #{deck.count}"
puts "Question: #{round.current_card.question}"
response = gets.chomp
guess = round.record_guess(response)
puts guess.feedback
card_number += 1
end
