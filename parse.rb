
class Parser
  attr_accessor :file, :array_of_card_hashes
  
  def initialize(filename = 'flashcard_samples.txt' )
    @file = filename
    @array_of_card_hashes = []
  end 

  def import_txt_file(file)
    @file =  File.open(file).read
  end

  def format_lines(file)
    @file.each_line do |row|
      @rows << row
    end
    # @rows
  end

  def slice_rows(rows)
    rows.each_slice(3) do |card|

      card.each do |element|
        element.gsub!(/(\n)/, "")
      end
      @cards_array << card
    end
    # @cards_array
  end

  def convert_to_hash(array_of_cards)
    card_hash = {}
    symb = [:definition, :answer]
    array_of_cards.each do |card|
      card.pop
      card_zipped = symb.zip(card)
      card_hash = Hash[card_zipped]
      @array_of_card_hashes << card_hash
    end
  end

  def build_card_array
    @rows = []
    @cards_array = []
    import_txt_file(@file)
    format_lines(file)
    slice_rows(@rows)
    convert_to_hash(@cards_array)
    @array_of_card_hashes
  end
end

# card = Parser.new('flashcard_samples.txt')
# p card.build_card_array


