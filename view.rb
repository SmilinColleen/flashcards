class View

  def self.initialize
    @@score = 0
  end

  def print_definition(definition)
    puts "#{definition}"
  end

  def print_score(score = @@score)
    @@score = score
    puts "You have #{score} points!!"
  end

  def print_game_finished_dialog
    puts "You have answered all the questions."
    puts "You accumulated #{print_score} points"
  end

  def print_ask_for_guess
    puts "What is the term?"
  end

  def print_correct_dialog
    puts "Correct.  You now have #{print_score} points.\n" + "-"*50
  end

  def print_incorrect_dialog
    puts "Incorrect. Please try again.\n"
  end

  def print_farewell
    puts "Bye byeeee!"
  end

end
