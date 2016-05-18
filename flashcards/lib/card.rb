class Card

attr_reader     :question,


  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def answer
    @answer
  end

end
