require_relative '../models/rewards_tx'
require 'ostruct'
require 'json'

describe 'RewardsTx' do
  describe 'Withdraw rewards transaction' do
    before do
      json = File.read("./spec/data/withdraw_rewards_tx.json")
      @transaction = RewardsTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date=>"2021-02-03T15:12:08.938Z",
          :description=>"Withdraw 29.375507 MIR from rewards.",
          :fee_amount=>0.001,
          :fee_currency=>"UST",
          :label=>"WITHDRAW_REWARDS",
          :received_amount=>29.375507,
          :received_currency=>"MIR",
          :sent_amount=>nil,
          :sent_currency=>nil,
          :tx_hash=>"92D49E9C003BC6EB234770E1EE8C3EDB188B5DDF99547A57CE2AA60F4B1AB43B"
        }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end

  describe 'Claim airdrop transaction' do
    before do
      json = File.read("./spec/data/claim_airdrop_tx.json")
      @transaction = RewardsTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date=>"2021-02-07T21:07:53.265Z",
          :description=>"Received 0.082341 MIR from airdrop.",
          :fee_amount=>0.001,
          :fee_currency=>"UST",
          :label=>"CLAIM_AIRDROP",
          :received_amount=>0.082341,
          :received_currency=>"MIR",
          :sent_amount=>nil,
          :sent_currency=>nil,
          :tx_hash=>"2458FE8268E8AF38533C01CCEE038A4F71EE005ABDD0103D3AE6FB8E3B273E6C"
        }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end
end