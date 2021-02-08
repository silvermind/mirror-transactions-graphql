require_relative '../models/gov_stake_unstake_tx'
require 'ostruct'
require 'json'

describe 'GovStakeUnstakeTx' do
  describe 'Gov Stake Transaction' do
    before do
      json = File.read("./spec/data/gov_stake_tx.json")
      @transaction = GovStakeUnstakeTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date => "2021-02-07T15:58:07.253Z",
          :description => "Staked 21565.545299 MIR in governance.",
          :fee_amount => 0.001,
          :fee_currency => "UST",
          :label => "GOV_STAKE",
          :received_amount => nil,
          :received_currency => nil,
          :sent_amount => 21565.545299,
          :sent_currency => "MIR",
          :tx_hash => "C7B3D6362498C22D90B322EDC2F66A3BDF345DE87859CD1CBE78B071F160799A",
        }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end

  describe 'Gov Unstake Transaction' do
    before do
      json = File.read("./spec/data/gov_unstake_tx.json")
      @transaction = GovStakeUnstakeTx.new(OpenStruct.new(JSON.parse(json)))
    end

    describe '.koinly_output' do
      it 'should return a hash in the Koinly format' do
        row = {
          :date => "2021-02-02T20:12:51.647Z",
          :description => "Unstaked 20140.472234 MIR in governance.",
          :fee_amount => 0.001,
          :fee_currency => "UST",
          :label => "GOV_UNSTAKE",
          :received_amount => 20140.472234,
          :received_currency => "MIR",
          :sent_amount => nil,
          :sent_currency => nil,
          :tx_hash => "714B6AE00C5F7013FEC275BAFBFCE07889842A44F450F769697DE8F910C638B4",
        }

        expect(@transaction.koinly_output).to eq [row]
      end
    end
  end
end