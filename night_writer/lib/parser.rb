class Parser


  def braille_lines(conversion)
    conversion = conversion.map {|char| char.scan(/.{1,2}/)}
    split_line = conversion.transpose
    split_line.map {|line| line.join}
  end


  def braille_characters(braille_lines)
    lines = braille_lines.split("\n")
  
  end

end
