require_relative './constants'
require_relative './base_tx'

class SendReceiveTx < BaseTx
  include Constants

  def sent_amount
    if send?
      data["amount"].to_f / MILLION
    end
  end

  def sent_currency
    if send?
      get_symbol_from_token(transaction.token)
    end
  end

  def received_amount
    if receive?
      data["amount"].to_f / MILLION
    end
  end

  def received_currency
    if receive?
      get_symbol_from_token(transaction.token)
    end
  end

  def send?
    type == "SEND"
  end

  def receive?
    type == "RECEIVE"
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
      "Sent #{received_amount} #{received_currency} from #{sender} to #{receiver}."
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