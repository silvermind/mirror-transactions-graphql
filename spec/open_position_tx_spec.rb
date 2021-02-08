require_relative '../models/open_position_tx'
require 'ostruct'
require 'json'

describe 'OpenPositionTx' do
  before do
    json = File.read("./spec/data/open_position_tx.json")
    @transaction = OpenPositionTx.new(OpenStruct.new(JSON.parse(json)))
  end

  describe '.koinly_output' do
    it 'should return a hash in the Koinly format' do
      row = {
        :date => "2021-02-04T00:54:36.252Z",
        :description => "Opened position 2598. Minted 0.759122 mNFLX with 700.0 UST of collateral.",
        :fee_amount => 1.403835,
        :fee_currency => "UST",
        :label => "OPEN_POSITION",
        :received_amount => 0.759122,
        :received_currency => "mNFLX",
        :sent_amount => 700.0,
        :sent_currency => "UST",
        :tx_hash => "0FB5D9218B42220DC46087D7C698195F2A91D51FC36ED806C007E4C96A947E94",
      }

      expect(@transaction.koinly_output).to eq [row]
    end
  end
end