require_relative '../models/burn_tx'
require 'ostruct'
require 'json'

describe 'BurnTx' do
  before do
    json = File.read("./spec/data/burn_tx.json")
    @transaction = BurnTx.new(OpenStruct.new(JSON.parse(json)))
  end

  describe '.koinly_output' do
    it 'should return a hash in the Koinly format' do
      row = {
        :date => "2021-01-29T19:40:07.938Z",
        :description => "Burned position 1192 with 1.421649 mUSO.",
        :fee_amount => 0.001,
        :fee_currency => "UST",
        :label => "BURN",
        :received_amount => nil,
        :received_currency => nil,
        :sent_amount => 1.421649,
        :sent_currency => "mUSO",
        :tx_hash => "969D32985C74240672423E11A6159F034A0FB150FF11A051D8AD2EAE1E5FEF25",
      }

      expect(@transaction.koinly_output).to eq [row]
    end
  end
end