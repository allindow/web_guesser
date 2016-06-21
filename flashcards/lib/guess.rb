class Guess
  attr_reader   :card,
                :response

  def initialize(response, card)
    @response = response.capitalize
    @card = card
  end

  def correct?
    response == card.answer
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

end
