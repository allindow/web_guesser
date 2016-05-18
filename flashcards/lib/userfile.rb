class UserFile
  attr_reader    :name

  def initialize(filename)
    @filename = filename
  end

end

#
# def record_guess(response)
#   @guesses << Guess.new(response, current_card)
#   guess = @guesses.last
#   if guess.correct?
#     @correct_count += 1
#   end
#   @current_card += 1
#   guess
# end
