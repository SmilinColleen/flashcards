class View

  @@score = 0

  def self.update_score!(score)
    @@score = score
    print_score
    puts 
  end

  def self.print_definition(definition)
    puts "#{definition}"
    print_ask_for_guess
  end

  def self.print_score
    puts "You have #{@@score} points!!"
  end

  def self.print_game_finished_dialog
    puts "You have answered all the questions."
    print_score
  end

  def self.print_ask_for_guess
    puts "-" * 50
    print "What is the term?   "
  end

  def self.print_correct_dialog
    puts "Correct."
  end

  def self.print_incorrect_dialog
    puts "Incorrect. Please try again."
    puts
  end

  def self.print_farewell
    print_score
    puts "Bye byeeee!"
  end

end
