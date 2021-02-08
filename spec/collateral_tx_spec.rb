require_relative '../models/collateral_tx'
require 'ostruct'
require 'json'

describe 'CollateralTx' do
  describe 'Withdraw collateral transaction' do
    before do
      json = File.read("./spec/data/withdraw_collateral_tx.json")
      @transaction = CollateralTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date=>"2021-01-14T14:12:25.461Z",
          :description=>"Withdraw 6895.0 UST of collateral from position 152.",
          :fee_amount=>106.403835,
          :fee_currency=>"UST",
          :label=>"WITHDRAW_COLLATERAL",
          :received_amount=>6895.0,
          :received_currency=>"UST",
          :sent_amount=>nil,
          :sent_currency=>nil,
          :tx_hash=>"A7F0910951C81C7F5E434098F90A123B9E3FCD71A64D3A2959AAD2769B23C86C"
        }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end

  describe 'Deposit collateral transaction' do
    before do
      json = File.read("./spec/data/deposit_collateral_tx.json")
      @transaction = CollateralTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date=>"2021-02-03T22:47:49.678Z",
          :description=>"Deposited 150.0 UST of collateral to position 2532.",
          :fee_amount=>0.911718,
          :fee_currency=>"UST",
          :label=>"DEPOSIT_COLLATERAL",
          :received_amount=>nil,
          :received_currency=>nil,
          :sent_amount=>150.0,
          :sent_currency=>"UST",
          :tx_hash=>"E717A36A178516539433F55D6AD24E224D255F4EB28BF655D52D6BEACC3B81BD"
        }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end
end