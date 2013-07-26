class Game

  def run!
    @deck = Deck.new
    load_cards
    @deck.shuffle
    until finished?
      card = deal
      View.print_defintion(card)
      guess(card)
    end
    View.print_score
    View.print_game_finished_dialog
  end

  def load_cards
    @deck #bla bla bla
  end

  def self.shuffle_deck
    @deck.shuffle
  end

  def finished?
    @deck.each do |card|
      return false if card.status ==:unanswered
    end
    return true
  end
  

  def self.deal
    @deck.cards.each {|card| return card unless card.answered? }
  end

  def self.guess(card)

    attempts_counter = 0

    until card.answered?

      attempts_counter += 1

      View.print_ask_for_guess
      user_answer = gets.chomp.downcase
      
      quit_game if user_answer == 'exit'

      if card.answer.downcase == user_answer
        mark_card!(card)
        update_score(attempts_counter)
        View.print_correct_answer_dialog
      else
        View.print_incorrect_answer_dialog
      end
    end
  end

  def self.mark_card!(card)
    @deck.card.mark!
  end

  def self.update_score(attempts)

    if attempts == 1
      @deck.score += 3
    else
      @deck.score += 1
    end

  end


  def quit
    View.print_score
    View.print_farewell
    exit
  end 


end
