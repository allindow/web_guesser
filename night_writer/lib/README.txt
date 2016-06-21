The idea of Night Writing was first developed for Napoleon's army so soldiers could communicate silently at night without light.
The concept of night writing led to Louis Braille's development of his Braille tactile writing system.

This program converts latin character messages into Braille-like characters represented by blocks of 2 by 3 where a . represents an unraised space and
0 represents a raised space.

Examples:

0.
00   => h
..

0.0.0.0.0....00.0.0.00
00.00.0..0..00.0000..0    => hello world
....0.0.0....00.0.0...

It also converts braille to latin characters!

A full alphabet of Braille can be found at http://braillebug.afb.org/braille_print.asp

To convert from latin characters to Braille, provide a message in the project root folder in message.txt
Then run
        $ ruby ./lib/night_write.rb message.txt braille.txt
This will return a message stating how many characters of braille were produced. Resulting conversion will be saved in
braille.txt in the project root folder.

To convert from Braille to latin characters, provide braille in braille.txt and run
      $ ruby ./lib/night_write.rb message.txt braille.txt
This will return a message stating how many latin characters were created, and the translated
message will be saved to message.txt
