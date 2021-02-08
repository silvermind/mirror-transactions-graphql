require_relative '../models/liquidity_tx'
require 'ostruct'
require 'json'

describe 'LiquidityTx' do
  describe 'Provide liquidity transaction' do
    before do
      json = File.read("./spec/data/provide_liquidity_tx.json")
      @transaction = LiquidityTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row_one = {
          :date=>"2021-02-01T09:49:08.930Z",
          :description=> "Sending 2029.349529 mSLV and 59402.675348 UST in exchange for 10725.789753 mSLV-UST LP.",
          :fee_amount=>1.403835,
          :fee_currency=>"UST",
          :label=>"PROVIDE_LIQUIDITY",
          :received_amount=>5362.8948765,
          :received_currency=>"mSLV-UST LP",
          :sent_amount=>2029.349529,
          :sent_currency=>"mSLV",
          :tx_hash=> "7D0E4DA3F308BB8B22DED4C149D02F8F619A71CA4CCE4B82E398065E07DB75C6"
        }

        row_two = {
          :date=>"2021-02-01T09:49:08.930Z",
          :description=> "Sending 2029.349529 mSLV and 59402.675348 UST in exchange for 10725.789753 mSLV-UST LP.",
          :fee_amount=>1.403835,
          :fee_currency=>"UST",
          :label=>"PROVIDE_LIQUIDITY",
          :received_amount=>5362.8948765,
          :received_currency=>"mSLV-UST LP",
          :sent_amount=>59402.675348,
          :sent_currency=>"UST",
          :tx_hash=> "7D0E4DA3F308BB8B22DED4C149D02F8F619A71CA4CCE4B82E398065E07DB75C6"
        }

        expect(@transaction.koinly_output).to eq [row_one, row_two]
      end
    end
  end

  describe 'Withdraw liquidity transaction' do
    before do
      json = File.read("./spec/data/withdraw_liquidity_tx.json")
      @transaction = LiquidityTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row_one = {
          :date=>"2021-02-03T15:16:43.124Z",
          :description=> "Withdrawing 27.554746 mAMZN and 104123.143572 UST in exchange for 1672.906648 mAMZN-UST LP.",
          :fee_amount=>0.001,
          :fee_currency=>"UST",
          :label=>"WITHDRAW_LIQUIDITY",
          :received_amount=>27.554746,
          :received_currency=>"mAMZN",
          :sent_amount=>836.453324,
          :sent_currency=>"mAMZN-UST LP",
          :tx_hash=> "E1012276770FA03AA7B75FF8DF5EDC54B672CB4A284EF3298B2DA6ECAF1998CC"
        }

        row_two = {
          :date=>"2021-02-03T15:16:43.124Z",
          :description=>
           "Withdrawing 27.554746 mAMZN and 104123.143572 UST in exchange for 1672.906648 mAMZN-UST LP.",
          :fee_amount=>0.001,
          :fee_currency=>"UST",
          :label=>"WITHDRAW_LIQUIDITY",
          :received_amount=>104123.143572,
          :received_currency=>"UST",
          :sent_amount=>836.453324,
          :sent_currency=>"mAMZN-UST LP",
          :tx_hash=> "E1012276770FA03AA7B75FF8DF5EDC54B672CB4A284EF3298B2DA6ECAF1998CC"
        }

        expect(@transaction.koinly_output).to eq [row_one, row_two]
      end
    end
  end
end