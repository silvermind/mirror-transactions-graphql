require_relative './constants'
require_relative './base_tx'

class BuySellTx < BaseTx
  include Constants

  def sent_amount
    data["offerAmount"].to_f / MILLION
  end

  def sent_currency
    get_symbol_from_token(data["offerAsset"])
  end

  def received_amount
    data["recvAmount"].to_f / MILLION
  end

  def received_currency
    get_symbol_from_token(data["askAsset"])
  end

  def price
    data["price"].to_f
  end

  def description
    if type == "BUY"
      "Bought #{received_amount} #{received_currency} at $#{price.round(3)} for #{sent_amount} #{sent_currency}."
    elsif type == "SELL"
      "Sold #{sent_amount} #{sent_currency} at $#{price.round(3)} for #{received_amount} #{received_currency}."
    else
      raise Error.new("Incorrect type for Buy/Sell model: #{type}")
    end
  end

  def data_details
    {
      sent_amount: sent_amount,
      sent_currency: sent_currency,
      received_amount: received_amount,
      received_currency: received_currency,
      description: description
    }
  end
end