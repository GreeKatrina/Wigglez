require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'
require 'time'

describe Wigglez::PickWig do
  before(:each) do
    @db = Wigglez.db
    @PickWig = Wigglez::PickWig.new
    @Donor = FactoryGirl.create(:user)
    @Receiver = FactoryGirl.create(:user2)
    @Wig = FactoryGirl.create(:wig)
    Wigglez::PostWig.new.run(@Wig, @Donor.id)
    @date_picked = Time.now.strftime("%m/%d/%Y")
  end

  describe 'user' do
    xit 'should be the receiver of the wig' do
      result = @PickWig.run(@Wig.id, @Receiver.id)
      expect(result.success?).to eq true
      expect(result.wig.receiver).to eq @Receiver.id
      expect(result.wig.donor).to eq @Donor.id
      expect(result.wig.date_picked).to eq @date_picked
    end

    xit 'has to be registered' do
      result = @PickWig.run(@Wig.id, @Receiver.id+1)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :receiver => ["The receiver is not registered."]
    end
  end

  describe 'wig' do
    xit 'has to exist' do
      result = @PickWig.run(@Wig.id+1, @Receiver.id)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :wig => ["That wig does not exist."]
    end
  end
end
