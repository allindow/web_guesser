class Parser


  def braille_split(message)
    message.map {|char| char.scan(/.{1,2}/)}
  end




end
