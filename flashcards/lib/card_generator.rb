class CardGenerator
  attr_reader    :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    # file = File.open(filename)
    # f_lines = file.read.to_s.split("\n")
    # card_array = f_lines.map {|set| set.split(",")}
    # card_array.map {|q,a| Card.new(q,a)}

    # file = File.open(filename)
    # f_lines = file.read(filename).split("\n")
    # card_array = f_lines.map {|set| set.split(",")}
    # # card_array.map {|q,a| Card.new(q,a)}
    # # file = File.open(filename)
    # #    f_lines = file.read.to_s.split("\n")
    # # f_lines = File.readlines(filename)
    # #    card_array = f_lines.map {|set| set.split(",")}
    #    card_array.map {|q,a| Card.new(q,a)}
    file = File.readlines(filename).map do |line|
    card = line.chomp.split(",")
    Card.new(card[0], card[1])
 end
  end

end


  # end
