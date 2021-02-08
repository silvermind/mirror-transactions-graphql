require_relative './constants'
require_relative 'amount_string'
require_relative './base_tx'

class LiquidityTx < BaseTx
  include Constants

  def assets
    assets = provide? ? data["assets"] : data["refundAssets"]
    
    assets.split(",").map(&:strip).map do |asset|
      AmountString.new(asset)
    end
  end

  def masset
    assets.find { |asset| asset.currency != "UST" }
  end

  def stablecoin
    assets.find { |asset| asset.currency == "UST" }
  end

  def lp_token_amount
    lp_token = provide? ? data["share"] : data["withdrawnShare"]
    lp_token.to_f / MILLION
  end

  def lp_token_currency
    "#{masset.currency}-#{stablecoin.currency} LP"
  end

  def provide?
    type == "PROVIDE_LIQUIDITY"
  end

  def withdraw?
    type == "WITHDRAW_LIQUIDITY"
  end

  def description
    if provide?
      "Sending #{masset} and #{stablecoin} in exchange for #{lp_token_amount} #{lp_token_currency}."
    elsif withdraw?
      "Withdrawing #{masset} and #{stablecoin} in exchange for #{lp_token_amount} #{lp_token_currency}."
    end
  end

  def data_details
    if provide?
      [
        {
          sent_amount: masset.amount,
          sent_currency: masset.currency,
          received_amount: lp_token_amount / 2,
          received_currency: lp_token_currency,
          description: description
        }, 
        {
          sent_amount: stablecoin.amount,
          sent_currency: stablecoin.currency,
          received_amount: lp_token_amount - lp_token_amount / 2,
          received_currency: lp_token_currency,
          description: description
        }
      ]
    elsif withdraw?
      [
        {
          sent_amount: lp_token_amount / 2,
          sent_currency: lp_token_currency,
          received_amount: masset.amount,
          received_currency: masset.currency,
          description: description
        }, 
        {
          sent_amount: lp_token_amount - lp_token_amount / 2,
          sent_currency: lp_token_currency,
          received_amount: stablecoin.amount,
          received_currency: stablecoin.currency,
          description: description
        }
      ]
    end
  end
end