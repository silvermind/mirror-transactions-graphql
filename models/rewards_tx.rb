require_relative './constants'
require_relative 'amount_string'

class RewardsTx < BaseTx
  include Constants

  def received_asset
    AmountString.new("#{transaction.data["amount"]}#{transaction.token}")
  end

  def description
    if lp_rewards?
      "Withdraw #{received_asset} from rewards."
    elsif airdrop?
      "Received #{received_asset} from airdrop."
    end
  end

  def airdrop?
    type == "CLAIM_AIRDROP"
  end

  def lp_rewards?
    type == "WITHDRAW_REWARDS"
  end

  def data_details
    {
      received_amount: received_asset.amount,
      received_currency: received_asset.currency,
      description: description
    }
  end
end