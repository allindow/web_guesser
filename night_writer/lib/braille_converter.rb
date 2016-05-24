class BrailleConverter
  attr_reader    :letters_to_braille,
                 :braille,
                 :text

  def initialize
    @braille = []
    @text = []
    @letters_to_braille = {
    "a" => "0.....", "b" => "0.0...","c" => "00....",
    "d" => "00.0..", "e" => "0..0..", "f" => "000...",
    "g" => "0000..", "h" => "0.00..", "i" => ".00...",
    "j" => ".000..", "k" => "0...0.", "l" => "0.0.0.",
    "m" => "00..0.", "n" => "00.00.", "o" => "0..00.",
    "p" => "000.0.", "q" => "00000.","r" => "0.000.",
    "s" => ".00.0.", "t" => ".0000.", "u" => "0...00",
    "v" => "0.0.00", "w" => ".000.0", "x" => "00..00",
    "y" => "00.000", "z" => "0..000", " " => "......",
    "." => "..00.0", "?" => "..0.00", "!" => "..000.",
    "'" => "....0.", "," => "..0...", "-" => "....00",
    :capital => ".....0", :number => ".0.0.."}
    @number_to_braille = {
      0 => ".000..", 1 => "0.....", 2 => "0.0...",
      3 => "00....", 4 => "00.0..", 5 => "0..0..",
      6 => "000...", 7 => "0000..", 8 => "0.00..",
      9 =>  ".00...", " " => "......", :number => ".0.0.."}
  end

  def letter_keys(message)
    message.each_char do |char|
      if letters_to_braille.key?(char)
        braille << letters_to_braille[char]
      elsif
        braille << letters_to_braille[:capital]
        braille << letters_to_braille[char.downcase]
      end
    end
  end

  def braille_keys(message)
    message.map do |char|
      if char == ".....0"
        next_character_index = message.index(char) + 1
        next_character = message[message.index(char)+ 1]
        text << letters_to_braille.invert[next_character].upcase
        message.delete_at(next_character_index)
      else
        text << letters_to_braille.invert[char]
      end
    end
    text.flatten
  end

  def convert!(message)
    if message[0][0] == "." || message[0][0] == "0"
      braille_keys(message).join
    else
      letter_keys(message)
      braille.flatten
    end
  end

end
