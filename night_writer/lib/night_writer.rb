class NightWriter
  attr_reader :file_reader,
              :converter,
              :parser


  def initialize
    @file_reader = FileReader.new
    @converter = BrailleConverter.new
    @parser = Parser.new
  end

  def encode_file_to_braille(filename = ARGV[0])
    plain = file_reader.read
    braille = encode_to_braille(plain)
    #call BrailleConverter
  end

  def encode_to_braille(input)
    braille_conversion = converter.convert!(input)
    parser.braille_split(braille_conversion)

    # you've taken in an INPUT string
    # do the magic
    # send out an OUTPUT string
    #going to be calling Parser
    #should return the braille equivalent of entire word, not parse out into the different arrays
    #new instance of FileWriter class
  end

  #need another class that actually sends output string to the new file_reader

end

#this is not the runner file... you will have another runner file to instantiate NightWriter and pass ARGV[0] it
