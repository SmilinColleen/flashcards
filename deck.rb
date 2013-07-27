class Deck
  
attr_reader :cards, :status, :score

  def initialize
    @cards = []
    @status = :unfinished
    
  end

  def add_card(card)
    @cards << card
  end

  def shuffle
    @cards.shuffle!
  end

  

  # def to_s
  #   @cards.each_with_index do |card, index|
  #     puts "#{index + 1} - #{card.definition}"
  #   end
  # end

end
