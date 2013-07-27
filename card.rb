class Card

  attr_reader :status, :definition, :answer
    
  def initialize(args)
    @definition = args[:definition]
    @answer = args[:answer]
    @status = args.fetch(:status){ :unanswered }
  end

  def answered?
    status == :answered
  end

  def mark!
    @status = :answered
  end
end

