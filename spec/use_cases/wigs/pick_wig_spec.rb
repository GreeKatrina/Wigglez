require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe Wigglez::PickWig do
  before(:each) do
    @db = Wigglez.db
    @PickWig = Wigglez::PickWig.new
    @Donor = FactoryGirl.create(:user)
    @Receiver = FactoryGirl.create(:user2)
    @Wig = FactoryGirl.create(:wig)
    # Wigglez::PostWig.new.run()
    t = Time.now
    @date_picked = "#{t.year} #{t.month} #{t.day}"
  end

  describe 'user' do
    xit 'should be the receiver of the wig' do
      result = @PickWig.run(@Receiver, @Wig)
      expect(result.success?).to eq true
      expect(result.wig.receiver).to eq @Receiver.id
      expect(result.wig.donor).to eq @Donor.id
      expect(result.wig.date_picked).to eq @date_picked
    end
  end
end
