require_relative 'parser'
require_relative 'deck'
require_relative 'card'
require_relative 'view'


class Game

  attr_reader :deck, :score

  def self.run!
    @score = 0
    @deck = Deck.new
    load_cards
    @deck.shuffle
    guess(@deck.deal) until @deck.finished?
    View.print_game_finished_dialog
  end

  def self.load_cards
    parser = Parser.new
    parser.build_card_array.each do |raw_card|
      @deck.add_card(Card.new(raw_card))
    end
  end

  def self.guess(card)
    attempts_num = 0
    until card.answered?
      attempts_num += 1
      View.print_definition(card.definition)
      verify_answer(:card => card, :user_answer => process_user_input)
      update_score(attempts_num) if card.answered?
    end
  end

  def self.verify_answer(args) # model tells the guess Principle of what vs how,
    card = args[:card]
    user_input = args[:user_answer]
    if card.answer.downcase == user_input
      card.mark!
      View.print_correct_dialog
    else
      View.print_incorrect_dialog
    end
  end

  def self.process_user_input
    user_input = gets.chomp.downcase
    quit_game if user_input == 'exit'
    return user_input
  end

  def self.update_score(attempts_num)
    @score += (attempts_num > 1 ? 1 : 3)
    View.update_score!(@score)
  end

  def self.quit_game
    View.print_farewell
    exit
  end
end

Game.run!
