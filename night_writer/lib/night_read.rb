require './lib/braille_converter'
require './lib/file_io'
require './lib/parser'

parser = Parser.new
file_io = FileIO.new
converter = BrailleConverter.new

braille = file_io.read
braille_split = parser.join_lines(braille)
braille_characters = parser.braille_characters(braille_split)
latin_characters = converter.convert!(braille_characters)
file_io.write(latin_characters)
character_count = file_io.read(ARGV[1]).chomp.length

 puts "Created '#{ARGV[1]}' containing #{character_count} characters."
