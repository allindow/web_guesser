require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

cards = CardGenerator.new("cards.txt").cards
# card_1 = Card.new("What is the capital of Alaska?", "juneau")
# card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
# card_3 = Card.new("What is the youngest Hanson brothers name?", "Zac")
# card_4 = Card.new("In roller derby, which skater has the star on her helmet?", "Jammer")
deck = Deck.new(cards)
round = Round.new(deck)

round.start
