require_relative 'parse'
require_relative 'deck'
require_relative 'card'

class Game

  attr_reader :deck

  def self.run!
    @score = 0
    @deck = Deck.new
    load_cards
    @deck.shuffle
    until finished?
      card = deal
      puts card.definition
      guess(card)
      # View.print_defintion(card.defintion)
    end
    # View.print_score(score)
    # View.print_game_finished_dialog
  end

  def self.load_cards
    parser = Parser.new
    parser.build_card_array.each do |raw_card|
      @deck.add_card(Card.new(raw_card))
    end
  end

  def self.shuffle_deck # maybe eloquent answered
    @deck.shuffle
  end

  def self.finished? #needs to know what not how
    @deck.cards.each do |card|
      return false if card.status ==:unanswered
    end
    return true
  end

  def self.deal # could be done with numerators, deck know's how to deal?
    @deck.cards.each {|card| return card unless card.answered? }
  end

  def self.guess(card)
    attempts_num = 0

    until card.answered?
      attempts_num += 1
      # View.print_ask_for_guess
      print "Whats your answer ???  "
      user_answer = process_user_input
      args = {:card => card, :user_answer => user_answer, :attempts_num => attempts_num}
      # verify_anwser(args) ? View.print_correct_dialog : View.print_incorrect_dialog
      puts verify_answer(args) ?  "Correct!!" : "Wrong!!! Bitch!"
    end
  end

  def self.verify_answer(args) # model tells the guess Principle of what vs how, 
    card = args[:card]

    if card.answer.downcase == args[:user_answer]
      mark_card!(card)
      update_score(args[:attempts_num])
      show_score
      return true
    end
    return false
  end

  def self.increment_score(value = 1)
    @score += value
  end

  def self.process_user_input
    user_input = gets.chomp.downcase
    quit_game if user_input == 'exit'
    return user_input
  end


  def self.mark_card!(card) 
    card.mark!
  end


  def self.update_score(attempts)
    if attempts == 1
      self.increment_score(3)
    else
      self.increment_score
    end
  end


  def self.quit_game
    # View.print_score
    puts "#{@deck.score}"
    # View.print_farewell
    puts "Bye byeeee!"
    exit
  end

  def self.deck
    puts @deck
  end

  def self.show_score
    puts "You have #{@score} points!!"
  end

end

Game.run!
