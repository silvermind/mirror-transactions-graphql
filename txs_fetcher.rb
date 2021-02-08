require 'graphql/client'
require 'graphql/client/http'
require 'csv'
require 'time'
require 'date'
require_relative './query'
require_relative './txs_exporter'

class TxsFetcher
  include Query
  attr_accessor :wallet, :transactions

  def initialize(wallet)
    @wallet = wallet
    @transactions = get_transactions
  end

  def get_transactions
    Client.query(Query::TransactionsQuery, variables: {
      wallet: @wallet,
      limit: 10000
    }).data.txs
  end

  def filter(types)
    transactions.select { |tx| types.include?(tx.type) }
  end

  def filter!(types)
    @transactions = filter(types)
  end

  def export_to_csv
    TxsExporter.new(transactions).write_to_csv
  end

  def self.get_json_fixture(wallet, type)
    # TODO: ["STAKE", "UNSTAKE"]

    tx_fetcher = TxsFetcher.new(wallet)
    tx_fetcher.get_transactions
    tx_fetcher.filter!([type])
    tx_fetcher.transactions.first.to_h.to_json
  end
end

puts "Please enter your public wallet address (e.g., terra123): \n"

wallet = gets.chomp
tx_fetcher = TxsFetcher.new(wallet)
tx_fetcher.get_transactions
tx_fetcher.export_to_csv

puts "Transactions output to output.csv"