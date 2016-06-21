class CardGenerator
  attr_reader    :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    file = File.readlines(filename).map do |line|
    card = line.chomp.split(",")
    Card.new(card[0], card[1])
    end
  end

end
