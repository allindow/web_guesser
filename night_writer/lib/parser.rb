class Parser


  def braille_lines(conversion)
    conversion = conversion.map {|char| char.scan(/.{1,2}/)}
    split_line = conversion.transpose
    split_line.map {|line| line.join}
  end


  def braille_characters(braille_lines)
    lines = braille_lines.split("\n")
    single_braille_character = ""
    all_braille_characters = []
    until lines[0] == ""
      lines.each do |line|
        single_braille_character << line.slice!(0..1)
          if single_braille_character.length == 6
            all_braille_characters << single_braille_character
            single_braille_character = ""
          end
        end
      end
      all_braille_characters
   end

end
