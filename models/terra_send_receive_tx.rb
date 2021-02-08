require_relative './constants'
require_relative './base_tx'

class TerraSendReceiveTx < BaseTx
  include Constants

  def sent_amount
    if send?
      data["amount"].to_f / MILLION
    end
  end

  def sent_currency
    if send?
      get_symbol_from_token(data["denom"])
    end
  end

  def received_amount
    if receive?
      data["amount"].to_f / MILLION
    end
  end

  def received_currency
    if receive?
      get_symbol_from_token(data["denom"])
    end
  end

  def fee
    fee_array = transaction.fee.split(",").map(&:strip).map do |asset|
      AmountString.new(asset)
    end

    fee_array.first
  end

  def send?
    type == "TERRA_SEND"
  end

  def receive?
    type == "TERRA_RECEIVE"
  end

  def sender
    data["from"]
  end

  def receiver
    data["to"]
  end

  def description
    if send?
      "Sent #{sent_amount} #{sent_currency} from #{sender} to #{receiver}."
    elsif receive?
      "Received #{received_amount} #{received_currency} from #{sender} to #{receiver}."
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