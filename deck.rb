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

  def deal
    @cards.each {|card| return card unless card.answered? }
  end

  def finished?
    @cards.each do |card|
      return false if card.status ==:unanswered
    end
    return true
  end
end

