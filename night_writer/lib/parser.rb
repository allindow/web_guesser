class Parser
  attr_reader   :message,
                :braille_array

  def initialize(converted_message)
    @converted_message = converted_message
    @braille_array = converted_message.scan(/.{1,2}/)

  end

  def braille_array_parser
    braille_array.map do |pair|
    pair.split
    end
  end
  #
  def line_parser

  #   this will look something like
  #line_1 = File.readlines("braille.txt" or ARGV[1])[0]
  #File.write("braille.txt" or ARGV[0], line_1 << parsed_b[0]
  #this will return an array so still need to convert to string

    end



end
