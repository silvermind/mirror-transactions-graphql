require_relative 'amount_string'
require 'ostruct'

class BaseTx
  attr_accessor :transaction

  def initialize(transaction)
    @transaction = OpenStruct.new(transaction.to_h)
  end

  def data
    transaction.data
  end

  def type
    transaction.type
  end

  def tx_hash
    transaction.txHash
  end

  def date
    transaction.datetime
  end

  def fee
    AmountString.new(transaction.fee)
  end

  def koinly_output
    if data_details.is_a? Array
      data_details.map { |data| base_hash.merge(data) }
    else
      [ base_hash.merge(data_details) ]
    end
  end

  def base_hash
    {
      date: date,
      sent_amount: nil,
      sent_currency: nil,
      received_amount: nil,
      received_currency: nil,
      fee_amount: fee.amount,
      fee_currency: fee.currency,
      label: type,
      description: nil,
      tx_hash: tx_hash
    }
  end
end