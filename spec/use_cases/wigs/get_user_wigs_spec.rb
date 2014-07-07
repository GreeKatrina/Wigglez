require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe Wigglez::GetUserWigs do
  before(:each) do
    @db = Wigglez.db
    @Donor = FactoryGirl.create(:user)
    @Receiver = FactoryGirl.create(:user2)
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
    @Wig2 = {
      material: 'synthetic',
      color: 'black',
      length: 'medium',
      gender: 'female',
      retail_estimate: 600,
      condition: 'new',
      construction: 'monofilament',
      size: 'average'
    }
    @Wig3 = {
      material: 'synthetic',
      color: 'blonde',
      length: 'short',
      gender: 'female',
      retail_estimate: nil,
      condition: 'new',
      construction: 'monofilament',
      size: 'average'
    }
    Wigglez::PostWig.new.run(@Wig, @Donor.id)
    Wigglez::PostWig.new.run(@Wig3, @Receiver.id)
  end

  it "should get all of a user's wigs" do
    wigs = Wigglez::GetUserWigs.new.run(@Donor.id)
    expect(wigs.count).to eq 1

    Wigglez::PostWig.new.run(@Wig2, @Donor.id)
    wigs = Wigglez::GetUserWigs.new.run(@Donor.id)
    expect(wigs.count).to eq 2

    expect(wigs.map &:donor_id).to include @Donor.id
    expect(wigs.map &:gender).to include 'female'
    expect(wigs.map &:retail_estimate).to include 600
    expect(wigs.map &:retail_estimate).to include 400
  end

  it "should get a user's posted wigs that are not picked yet" do
    posted_wig = Wigglez::PostWig.new.run(@Wig2, @Donor.id)
    wigs = Wigglez::GetUserWigs.new.not_picked(@Donor.id)
    expect(wigs.count).to eq 2
    expect(wigs.map &:donor_id).to include @Donor.id
    expect(wigs.map &:gender).to include 'female'
    expect(wigs.map &:retail_estimate).to include 600
    expect(wigs.map &:retail_estimate).to include 400

    Wigglez::PickWig.new.run(posted_wig.wig.id, @Receiver.id)
    wigs = Wigglez::GetUserWigs.new.not_picked(@Donor.id)
    expect(wigs.count).to eq 1
    expect(wigs.map &:donor_id).to include @Donor.id
    expect(wigs.map &:gender).to include 'female'
    expect(wigs.map &:retail_estimate).to include 400
    expect(wigs.map &:retail_estimate).to_not include 600
  end

  after(:each) do
    @db.CLEAR_ALL
  end
end
