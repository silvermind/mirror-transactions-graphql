require_relative './constants'
require_relative 'amount_string'

class TerraSwapTx < BaseTx
  include Constants

  def sent_asset
    AmountString.new(transaction.data["offer"])
  end

  def received_asset
    AmountString.new(transaction.data["swapCoin"])
  end

  def description
    "Swapped #{sent_asset} for #{received_asset}."
  end

  def data_details
    {
      sent_amount: sent_asset.amount,
      sent_currency: sent_asset.currency,
      received_amount: received_asset.amount,
      received_currency: received_asset.currency,
      description: description
    }
  end
end