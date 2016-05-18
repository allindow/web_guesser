require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require './lib/userfile'

if ARGV[0].nil?
  puts "What is your file name?"
  filename = gets.chomp
else
  filename = ARGV[0]
end

cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

round.start
round.end_it
