
The idea of Night Writing was first developed for Napoleon's army so soldiers could communicate silently at night without light. The concept of night writing led to Louis Braille's development of his Braille tactile writing system.

In this project we'll implement systems for generating Braille-like text from normal characters and the reverse.

Simulating Braille

Braille uses a two-by-three grid of dots to represent characters. We'll simulate that concept by using three lines of symbols:

0.0.0.0.0....00.0.0.00
00.00.0..0..00.0000..0
....0.0.0....00.0.0...
The 0 represents a raised dot. The period is an unraised space. The above code reads "hello world" in normal text.


An Interaction Model

        The tool is used from the command line like so:

        $ ruby ./lib/night_write.rb message.txt braille.txt
        Created 'braille.txt' containing 256 characters
        That will use the plaintext file message.txt to create a Braille simulation file braille.txt.

        Then we can convert that Braille simulation back to normal text:

        $ ruby ./lib/night_read.rb braille.txt original_message.txt
        Created 'original_message.txt' containing 256 characters.
