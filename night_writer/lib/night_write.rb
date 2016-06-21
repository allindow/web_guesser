require './lib/braille_converter'
require './lib/file_io'
require './lib/parser'

parser = Parser.new
file_io = FileIO.new
converter = BrailleConverter.new

latin_characters = file_io.read
braille_characters = converter.convert!(latin_characters)
lined_braille = parser.braille_lines(braille_characters)
file_io.write(lined_braille)
character_count = file_io.read(ARGV[1]).chomp.length/6

 puts "Created '#{ARGV[1]}' containing #{character_count} characters."
