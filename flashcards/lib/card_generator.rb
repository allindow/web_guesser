# require './lib/card'

class CardGenerator
  attr_reader    :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    # f_lines = file.readlines("\n")
    file = File.open(filename)
    f_lines = file.read.to_s.split("\n")
    card_array = f_lines.map {|set| set.split(",")}
    card_array.map {|q,a| Card.new(q,a)}
  end

end
