class Parser


  def braille_lines(conversion)
    split_line_limit = []
    conversion = conversion.map {|char| char.scan(/.{1,2}/)}
    split_line = conversion.transpose.map {|line| line.join}
    until split_line[0] == ""
         split_line.each do |line|
            split_line_limit << line.slice!(0..79)+"\n"
          end
      end
    split_line_limit.join("")
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
