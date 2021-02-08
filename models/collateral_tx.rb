require_relative './constants'
require_relative 'amount_string'

class CollateralTx < BaseTx
  include Constants

  def received_asset
    AmountString.new(transaction.data["withdrawAmount"])
  end

  def sent_asset
    AmountString.new(transaction.data["depositAmount"])
  end

  def protocol_fee
    AmountString.new(transaction.data["protocolFeeAmount"])
  end

  def tax_amount
    AmountString.new(transaction.data["taxAmount"])
  end

  def regular_fee
    AmountString.new(transaction.fee)
  end

  def position_idx
    transaction.data["positionIdx"]
  end

  def fee
    if withdraw?
      protocol_fee + tax_amount + regular_fee
    elsif deposit?
      regular_fee
    end
  end

  def description
    if withdraw?
      "Withdraw #{received_asset} of collateral from position #{position_idx}."
    elsif deposit?
      "Deposited #{sent_asset} of collateral to position #{position_idx}."
    end
  end

  def withdraw?
    type == "WITHDRAW_COLLATERAL"
  end

  def deposit?
    type == "DEPOSIT_COLLATERAL"
  end

  def data_details
    if withdraw?
      {
        received_amount: received_asset.amount,
        received_currency: received_asset.currency,
        description: description
      }
    elsif deposit?
      {
        sent_amount: sent_asset.amount,
        sent_currency: sent_asset.currency,
        description: description
      }
    end
  end
end