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
    attempts_num = 0

    until card.answered?
      attempts_num += 1
      View.print_ask_for_guess
      user_answer = process_user_input
      args = {:card => card, :user_answer => user_answer, :attempts_num => attempts_num}
      verify_anwser(args) ? View.print_correct_dialog : View.print_incorrect_dialog
    end
  end

  def self.verify_anwser(args)
    card = args[:card]

    if card.answer.downcase == args[:user_answer]
      mark_card!(card)
      update_score(args[:attempts_num])
      return true
    end
    return false
  end

  def self.process_user_input
    user_input = gets.chomp.downcase
    quit_game if user_input == 'exit'
    return user_input
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
