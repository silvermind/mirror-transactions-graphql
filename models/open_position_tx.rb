require_relative './constants'
require_relative 'amount_string'

class OpenPositionTx < BaseTx
  include Constants

  def minted_asset
    AmountString.new(transaction.data["mintAmount"])
  end

  def collateral
    AmountString.new(transaction.data["collateralAmount"])
  end

  def position_idx
    transaction.data["positionIdx"]
  end

  def description
    "Opened position #{position_idx}. Minted #{minted_asset} with #{collateral} of collateral."
  end

  def data_details
    {
      sent_amount: collateral.amount,
      sent_currency: collateral.currency,
      received_amount: minted_asset.amount,
      received_currency: minted_asset.currency,
      description: description
    }
  end
end