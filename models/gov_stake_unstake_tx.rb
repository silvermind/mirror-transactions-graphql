require_relative './constants'
require_relative 'amount_string'
require_relative './base_tx'

class GovStakeUnstakeTx < BaseTx
  include Constants

  def asset
    AmountString.new("#{transaction.data["amount"]}#{transaction["token"]}")
  end

  def sent_amount
    asset.amount if stake?
  end

  def sent_currency
    asset.currency if stake?
  end

  def received_amount
    asset.amount if unstake?
  end

  def received_currency
    asset.currency if unstake?
  end

  def stake?
    type == "GOV_STAKE"
  end

  def unstake?
    type == "GOV_UNSTAKE"
  end

  def description
    if stake?
      "Staked #{asset} in governance."
    elsif unstake?
      "Unstaked #{asset} in governance."
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