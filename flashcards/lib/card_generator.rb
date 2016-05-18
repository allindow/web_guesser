require './lib/card'

class CardGenerator


  attr_reader    :file

  def initialize(file)
    @file = file
  end

  def cards
    file = File.open("cards.txt")
    f_lines = file.read.to_s.split("\n")
    card_array = f_lines.map {|set| set.split(",")}
    card_array.map {|q,a| Card.new(q,a)}
  end

end
