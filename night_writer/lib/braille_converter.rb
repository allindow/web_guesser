class BrailleConverter
  attr_reader    :letters_to_braille,
                 :braille,
                 :text,
                 :number_to_braille

  def initialize
    @braille            = []
    @text               = []
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
    :capital => ".....0"}
    @number_to_braille  = {
      "0" => ".000..", "1" => "0.....", "2" => "0.0...",
      "3" => "00....", "4" => "00.0..", "5" => "0..0..",
      "6" => "000...", "7" => "0000..", "8" => "0.00..",
      "9" =>  ".00...", :number => ".0.0.."}
  end


  def text_to_braille(message)
    message.each_char do |char|
      next_character_index = message.index(char) + 1
      next_character = message[message.index(char)+ 1]
      previous_character_index = message.index(char) - 1
      previous_character = message[message.index(char) - 1]
      if letters_to_braille.key?(char)
      braille << letters_to_braille[char]
      elsif number_to_braille.key?(char)
        if braille.last == "......"
          braille << number_to_braille[:number] << number_to_braille[char]
        else
          braille << number_to_braille[char]
        end
      elsif letters_to_braille.key?(char.downcase)
        braille << letters_to_braille[:capital] << letters_to_braille[char.downcase]
      end
    end
    braille.flatten
  end

  def braille_to_text(message)
      message.each do |char|
      next_character_index = message.index(char) + 1
      next_character = message[message.index(char)+ 1]
      previous_character_index = message.index(char) - 1
      previous_character = message[message.index(char) - 1]
      if char == "......"
        text << letters_to_braille.invert[char]
      elsif char == ".0.0.."
            text << number_to_braille.invert[next_character]
            message.delete_at(next_character_index)
      elsif number_to_braille.key?(text.last)
            text << number_to_braille.invert[char]
      elsif char == ".....0"
        message.delete_at message.index(char)
        text << letters_to_braille.invert[next_character].upcase
      else
        text << letters_to_braille.invert[char]
    end
  end
  text.join
  end

  def convert!(message)
    if message[0][0] == "." || message[0][0] == "0"
      braille_to_text(message)
    else
      text_to_braille(message)
    end
  end

  def wrap_text(converted_text)
    split_line_limit = []
    converted_text = converted_text.chars
    converted_text = converted_text.map {|char| char.scan(/.{1,2}/)}
    split_line = converted_text.transpose.map {|line| line.join}
  until split_line[0] == ""
       split_line.each do |line|
          split_line_limit << line.slice!(0..79)+"\n"
        end
    end
  split_line_limit.join("")
  end

end
