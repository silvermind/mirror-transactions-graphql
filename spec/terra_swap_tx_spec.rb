require_relative '../models/terra_swap_tx'
require 'ostruct'
require 'json'

describe 'TerraSwapTx' do
  before do
    json = File.read("./spec/data/terra_swap_tx.json")
    @transaction = TerraSwapTx.new(OpenStruct.new(JSON.parse(json)))
  end

  describe '.koinly_output' do
    it 'should return a hash in the Koinly format' do
      row = {
        :date=>"2020-12-29T07:19:59.131Z",
        :description=>"Swapped 35.49224 UST for 55.637796 LUNA.",
        :fee_amount=>0.000829,
        :fee_currency=>"LUNA",
        :label=>"TERRA_SWAP",
        :received_amount=>55.637796,
        :received_currency=>"LUNA",
        :sent_amount=>35.49224,
        :sent_currency=>"UST",
        :tx_hash=>"E5D957FA2BADC5D9D1350D624231D84235CCA8573CA704CEB8899575CB34EE19"
      }

      expect(@transaction.koinly_output).to eq [row]
    end
  end
end