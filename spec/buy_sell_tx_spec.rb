require_relative '../models/buy_sell_tx'
require 'ostruct'
require 'json'

describe 'BuySellTx' do
  describe 'Buy transaction' do
    before do
      json = File.read("./spec/data/buy_tx.json")
      @transaction = BuySellTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date => "2021-02-05T15:46:47.631Z",
          :description => "Bought 6.114397 mAAPL at $163.548 for 1000.0 UST.",
          :fee_amount => 1.43953,
          :fee_currency => "UST",
          :label => "BUY",
          :received_amount => 6.114397,
          :received_currency => "mAAPL",
          :sent_amount => 1000.0,
          :sent_currency => "UST",
          :tx_hash => "351E94F9CA4036550919DCC63E3F78E5679A6A6F91A7CDFA5F0302B672388569",
        }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end

  describe 'Sell transaction' do
    before do
      json = File.read("./spec/data/sell_tx.json")
      @transaction = BuySellTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date => "2021-02-07T11:38:05.879Z",
          :description => "Sold 5.405546 MIR at $4.631 for 24.879581 UST.",
          :fee_amount => 0.001,
          :fee_currency => "UST",
          :label => "SELL",
          :received_amount => 24.879581,
          :received_currency => "UST",
          :sent_amount => 5.405546,
          :sent_currency => "MIR",
          :tx_hash => "9262CD1311603AC74537D0AF136675A8D06425B02BDE816D8B63B20DE5B63C07",
        }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end
end