require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe Wigglez::PostWig do
  before(:each) do
    @db = Wigglez.db
    @PostWig = Wigglez::PostWig.new
    @User = FactoryGirl.create(:user)
    @Wig = {
      donor_id: @User.id,
      material: 'synthetic',
      color: 'brown',
      length: 'long',
      gender: 'female',
      retail_estimate: '400',
      condition: 'new',
      construction: 'custom',
      size: 'average'
    }
  end

  describe 'params' do
    it "should have the tracking number, receiver_id, date picked, and received set to nil" do
      result = @PostWig.run(@Wig)
      expect(result.success?).to eq true
      expect(result.wig.tracking_number).to eq nil
      expect(result.wig.receiver).to eq nil
      expect(result.wig.date_picked).to eq nil
      expect(result.wig.received).to eq nil
    end
  end



  after :each do
    @db.CLEAR_ALL
  end
end
