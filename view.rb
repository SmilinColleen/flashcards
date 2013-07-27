class View



  def self.print_definition(definition)
    puts "#{definition}"
  end

  def self.print_score(score)
    puts "You have #{score} points!!"
  end

  def self.print_game_finished_dialog(score)
    puts "You have answered all the questions."
    print_score(score)
  end

  def self.print_ask_for_guess
    puts "-" * 50
    print "What is the term?   "
  end

  def self.print_correct_dialog(score)
    puts "Correct."
    print_score(score)
    puts 
  end

  def self.print_incorrect_dialog
    puts "Incorrect. Please try again."
    puts
  end

  def self.print_farewell(score)
    print_score(score)
    puts "Bye byeeee!"
  end

end
