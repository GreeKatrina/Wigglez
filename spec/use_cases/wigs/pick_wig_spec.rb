require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'
require 'time'
require 'timecop'

describe Wigglez::PickWig do
  before(:each) do
    Timecop.freeze(DateTime.now)
    @db = Wigglez.db
    @PickWig = Wigglez::PickWig.new
    @Donor = FactoryGirl.create(:user)
    @Receiver = FactoryGirl.create(:user2)
    @PostWig = Wigglez::PostWig.new
    @Wig = {
        material: 'synthetic',
        color: 'medium brown',
        length: 'long',
        gender: 'female',
        retail_estimate: 400,
        condition: 'new',
        construction: 'monofilament',
        size: 'average'
      }
  end

  describe 'user' do
    it 'should be the receiver of the wig' do
      posted_wig = @PostWig.run(@Wig, @Donor.id)
      result = @PickWig.run(posted_wig.wig.id, @Receiver.id)
      expect(result.success?).to eq true
      expect(result.wig.receiver_id).to eq @Receiver.id
      expect(result.wig.donor_id).to eq @Donor.id
      expect(result.wig.date_picked).to eq DateTime.now
    end

    it 'has to be registered' do
      posted_wig = @PostWig.run(@Wig, @Donor.id)
      result = @PickWig.run(posted_wig.wig.id, @Receiver.id+1)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :receiver => ["The receiver is not registered."]
    end

    it "cannot pick a wig they posted" do
      posted_wig = @PostWig.run(@Wig, @Receiver.id)
      result = @PickWig.run(posted_wig.wig.id, @Receiver.id)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :receiver => ["You cannot pick your own wig."]
    end
  end

  describe 'wig' do
    it 'has to exist' do
      posted_wig = @PostWig.run(@Wig, @Donor.id)
      result = @PickWig.run(posted_wig.wig.id+1, @Receiver.id)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :wig => ["That wig does not exist."]
    end
  end

  after(:each) do
    @db.CLEAR_ALL
  end
end
