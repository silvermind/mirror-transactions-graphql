require_relative '../models/terra_send_receive_tx'
require 'ostruct'
require 'json'

describe 'TerraSendReceiveTx' do
  describe 'Terra send transaction' do
    before do
      json = File.read("./spec/data/terra_send_tx.json")
      @transaction = TerraSendReceiveTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.send?' do
      it 'should return true' do
        expect(@transaction.send?).to eq true
      end
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date=>"2021-02-08T00:25:08.009Z",
          :description=>"Sent 10000.0 UST from terra13yxhrk08qvdf5zdc9ss5mwsg5sf7zva9xrgwgc to terra1ykevv8ug5ag9gt2en0lgkd87rryk536w55r56m.",
          :fee_amount=>0.000566,
          :fee_currency=>"LUNA",
          :label=>"TERRA_SEND",
          :received_amount=>nil,
          :received_currency=>nil,
          :sent_amount=>10000.0,
          :sent_currency=>"UST",
          :tx_hash=>"E55A514C01BD752D701656439DD23B90007959D41C51815571F3B84632715FF6"
         }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end

  describe 'Terra receive transaction' do
    before do
      json = File.read("./spec/data/terra_receive_tx.json")
      @transaction = TerraSendReceiveTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date=>"2021-02-08T04:53:37.342Z",
          :description=>"Received 51865.0 UST from terra1hhmmu0hqx9ge7f8tcype4r6szvy3tfdpjcc5hr to terra13yxhrk08qvdf5zdc9ss5mwsg5sf7zva9xrgwgc.",
          :fee_amount=>0.0,
          :fee_currency=>"UST",
          :label=>"TERRA_RECEIVE",
          :received_amount=>51865.0,
          :received_currency=>"UST",
          :sent_amount=>nil,
          :sent_currency=>nil,
          :tx_hash=>"FB1916B4EBA4FB9268C70F7EC3E588600B6213B5278C0D1AEC63043C0E66A793"
        }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end
end