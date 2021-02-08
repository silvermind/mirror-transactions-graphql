Dir["./models/*.rb"].each {|file| require file }

class TxsExporter
  attr_accessor :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def write_to_csv(file_name="output.csv")
    CSV.open(file_name, "wb+") do |csv|
      csv << header_row
      transactions.each do |tx|
        output = get_koinly_output(tx)
        output.each { |row| csv << row.values } if output
      end
    end
  end

  def get_koinly_output(tx)
    if tx.type == "OPEN_POSITION"
      OpenPositionTx.new(tx).koinly_output
    elsif tx.type == "GOV_STAKE" || tx.type == "GOV_UNSTAKE"
      GovStakeUnstakeTx.new(tx).koinly_output
    elsif tx.type == "PROVIDE_LIQUIDITY" || tx.type == "WITHDRAW_LIQUIDITY"
      LiquidityTx.new(tx).koinly_output
    elsif tx.type == "BURN"
      BurnTx.new(tx).koinly_output
    elsif tx.type == "SELL" || tx.type == "BUY"
      BuySellTx.new(tx).koinly_output
    elsif tx.type == "WITHDRAW_REWARDS" || tx.type == "CLAIM_AIRDROP"
      RewardsTx.new(tx).koinly_output
    elsif tx.type == "SEND" || tx.type == "RECEIVE"
      SendReceiveTx.new(tx).koinly_output
    elsif tx.type == "TERRA_SEND" || tx.type == "TERRA_RECEIVE"
      TerraSendReceiveTx.new(tx).koinly_output
    elsif tx.type == "TERRA_SWAP"
      TerraSwapTx.new(tx).koinly_output
    elsif tx.type == "DEPOSIT_COLLATERAL" || tx.type == "WITHDRAW_COLLATERAL"
      CollateralTx.new(tx).koinly_output
    elsif tx.type == "STAKE" || tx.type == "UNSTAKE"
      nil
    else
      raise Exception.new("Type #{tx.type} not found.")
    end
  end

  def header_row
    # Koinly custom CSV headers
    ["date", "sent_amount", "sent_currency", "received_amount",
      "received_currency", "fee_amount", "fee_currency", "label",
      "description", "txHash"]
  end
end