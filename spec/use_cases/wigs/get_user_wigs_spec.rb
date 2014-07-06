require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe Wigglez::GetUserWigs do
  before(:each) do
    @db = Wigglez.db
    @Donor = FactoryGirl.create(:user)
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
    Wigglez::PostWig.new.run(@Wig, @Donor.id)
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

  after(:each) do
    @db.CLEAR_ALL
  end
end
