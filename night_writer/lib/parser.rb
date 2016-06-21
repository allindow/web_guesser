class Parser

  def join_lines(one_braille_string)
    braille_split = one_braille_string.split("\n")
    current_index = 0
    until braille_split.count == 3
      braille_split[current_index]+= braille_split[3]
      braille_split.delete_at(3)
      if current_index == 2
        current_index = 0
      else
        current_index += 1
      end
    end
    braille_split
  end

  def wrap_braille(split_line)
    split_line_limit = []
    until split_line[0].empty?
      split_line.each do |line|
        split_line_limit << line.slice!(0..79)+"\n"
      end
    end
    split_line_limit.join("")
  end

  def braille_lines(conversion)
    split_line_limit = []
    conversion = conversion.map {|char| char.scan(/.{1,2}/)}
    split_line = conversion.transpose.map {|line| line.join}
    wrap_braille(split_line)
  end


  def braille_characters(braille_lines)
    single_braille_character = ""
    all_braille_characters = []
    until braille_lines[0].empty?
      braille_lines.each do |line|
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
