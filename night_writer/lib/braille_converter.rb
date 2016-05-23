class BrailleConverter
  attr_reader   :message,
                :letters_to_braille


  def initialize(message)
    @message = message
    @letters_to_braille =
    {"a" => "0.....\n",
    "b" => "0.0...\n",
    "c" => "00....\n",
    "d" => "00.0..\n",
    "e" => "0..0..\n",
    "f" => "000...\n",
    "g" => "0000..\n",
    "h" => "0.00..\n",
    "i" => ".00...\n",
    "j" => ".000..\n",
    "k" => "0...0.\n",
    "l" => "0.0.0.\n",
    "m" => "00..0.\n",
    "n" => "00.00.\n",
    "o" => "0..00.\n",
    "p" => "000.0.\n",
    "q" => "00000.\n",
    "r" => "0.000.\n",
    "s" => ".00.0.\n",
    "t" => ".0000.\n",
    "u" => "0...00\n",
    "v" => "0.0.00\n",
    "w" => ".000.0\n",
    "x" => "00..00\n",
    "y" => "00.000\n",
    "z" => "0..000\n",
    " " => "......\n"}

  end

  def letter_keys
    message.chars.map do |char|
    letters_to_braille[char]
    end
  end

  def braille_keys
    message.map do |char|
    letters_to_braille.invert[char]
    end
  end

  def convert!
      letters_to_braille.key?(message[0]) ? letter_keys : braille_keys.join
  end


end
