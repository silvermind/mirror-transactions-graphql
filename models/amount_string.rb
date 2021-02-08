class AmountString
  attr_accessor :amount, :currency
  include Constants

  def initialize(amount_str)
    unless amount_str.nil?
      captures = amount_str.strip.match(/([0-9]*)(.*)/).captures
      @amount = captures[0].to_f / MILLION
      @currency = get_symbol_from_token(captures[1])
    end
  end

  def to_s
    "#{amount} #{currency}"
  end

  def +(otherAmountString)
    raise Exception.new("Currencies do not match.") if self.currency != otherAmountString.currency
    
    AmountString.new(nil).tap do |newAmountString|
      newAmountString.amount = self.amount + otherAmountString.amount
      newAmountString.currency = self.currency
    end
  end
end