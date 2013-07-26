class Deck
  
  def initialize
    @cards = []
    @status = :unfinished
    @score = 0
  end

  def add_card(card)
    @cards << card
  end

  def shuffle
    @cards.shuffle!
  end

end
