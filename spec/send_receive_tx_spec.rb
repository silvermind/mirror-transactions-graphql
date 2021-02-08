require_relative '../models/send_receive_tx'
require 'ostruct'
require 'json'

describe 'SendReceiveTx' do
  describe 'Send transaction' do
    before do
      json = File.read("./spec/data/send_tx.json")
      @transaction = SendReceiveTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date=>"2021-02-07T20:28:44.555Z",
          :description=>"Sent 8.0 mAMZN from terra1vncxandagnrtdczdkea8puj5j5d3g3qcj85egk to terra13yxhrk08qvdf5zdc9ss5mwsg5sf7zva9xrgwgc.",
          :fee_amount=>0.001,
          :fee_currency=>"UST",
          :label=>"SEND",
          :received_amount=>nil,
          :received_currency=>nil,
          :sent_amount=>8.0,
          :sent_currency=>"mAMZN",
          :tx_hash=>"4658B85E70BF28E643718F462F964EBC662BF3AB6FADB7A3750F970FC2F44845"
         }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end

  describe 'Receive transaction' do
    before do
      json = File.read("./spec/data/receive_tx.json")
      @transaction = SendReceiveTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date=>"2021-01-31T04:25:09.964Z",
          :description=>"Sent 43.4 MIR from terra1rvxcszyfecrt2v3a7md8p30hvu39kj6xf48w9e to terra13q8v8c3ee67fvag33n7zyws0dex5y4tvrq59rr.",
          :fee_amount=>0.0,
          :fee_currency=>"UST",
          :label=>"RECEIVE",
          :received_amount=>43.4,
          :received_currency=>"MIR",
          :sent_amount=>nil,
          :sent_currency=>nil,
          :tx_hash=>"548BEBD21B3E8F8F67D845428A674A6D0172D4201A9295B2F8A97CB60DD85C1A"
         }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end
end