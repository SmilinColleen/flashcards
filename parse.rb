# require 'csv'

# filename = 'flashcard_samples.txt'

# def load_card(filename)
#   @new_string = File.open(filename, 'rb') { |file| file.read}
# end

# def remove_newlines
#   filename = 'flashcard_samples.txt'
#   string = load_card(filename)
#   modified_string = string.gsub(/(\n)/, " ")
# end

def create_array
  filename = 'flashcard_samples.txt'
  new_string = load_card(filename)
  new_string.lines.each_slice(2).take(2)
end

# p load_card('flashcard_samples.txt')

# p create_array

# p remove_newlines

# p "Next should be new"

# p create_array

def build_cards

  rows = []
  cards_array = []


  file =  File.open('flashcard_samples.txt').read
  file.gsub!(/\r\n?/, "\n")


  puts "-"*50
  


  file.each_line do |row|

    rows << row

  end

  # p rows
  puts "-"*50

  rows.each_slice(3) do |card|
    card.each do |element|
      element.gsub!(/(\n)/, "")
    end
    cards_array << card
  end



  puts "-"*50

  cards_array.each do |card|

    # card = Card.new(definition: card[0] , answer: card[1])
    # deck.add_card(card)
    symb = [:definition, :answer]
    card.pop
    
    card_zipped = symb.zip(card)
    card_hash = Hash[card_zipped]
    
    p card_hash

  end


end

build_cards
