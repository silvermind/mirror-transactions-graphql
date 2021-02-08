require_relative './constants'
require_relative 'amount_string'
require_relative './base_tx'

class BurnTx < BaseTx
  include Constants

  def burned_asset
    AmountString.new(transaction.data["burnAmount"])
  end

  def position_idx
    transaction.data["positionIdx"]
  end

  def description
    "Burned position #{position_idx} with #{burned_asset}."
  end

  def data_details
    {
      sent_amount: burned_asset.amount,
      sent_currency: burned_asset.currency,
      description: description
    }
  end
end