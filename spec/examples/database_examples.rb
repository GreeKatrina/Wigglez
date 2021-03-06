require 'spec_helper'

shared_examples 'a database' do

  before :each do
    @db = described_class.new
    @user = FactoryGirl.create(:user)
    @wig = FactoryGirl.create(:wig, donor_id: @user.id)
    @wig2 = FactoryGirl.create(:wig2, donor_id: @user.id)
  end

  it 'creates a user' do
    expect(@user.id).to_not be_nil
    expect(@user.name).to eq 'Katrina'
  end

  it 'gets a user by id' do
    retrieved_user = @db.get_user(@user.id)
    expect(retrieved_user.id).to eq @user.id
    expect(retrieved_user.name).to eq @user.name
    expect(retrieved_user.email).to eq @user.email
  end

  it 'retreives a user by email' do
    retrieved_user = @db.get_user_by_email(@user.email)
    expect(retrieved_user.name).to eq 'Katrina'
    expect(retrieved_user.email).to eq @user.email
  end

  it 'deletes a user' do
    retrieved_user = @db.get_user(@user.id)
    expect(retrieved_user.id).to eq @user.id
    @db.delete_user(@user.id)
    retrieved_user2 = @db.get_user(@user.id)
    expect(retrieved_user2).to eq nil
  end

  it "allows a donor to create a wig" do
    expect(@wig).to_not be_nil
    expect(@wig.donor_id).to eq @user.id
    expect(@wig.material).to eq 'synthetic'
    expect(@wig.color).to eq 'medium brown'
    expect(@wig.length).to eq 'long'
    expect(@wig.gender).to eq 'female'
    expect(@wig.retail_estimate).to eq 400
    expect(@wig.condition).to eq 'new'
    expect(@wig.construction).to eq 'monofilament'
    expect(@wig.size).to eq 'average'
  end

  it 'retreives a wig' do
    retrieved_wig = @db.get_wig(@wig.id)
    expect(retrieved_wig.color).to eq 'medium brown'
    expect(retrieved_wig.length).to eq 'long'
    expect(retrieved_wig.retail_estimate).to eq 400

    retrieved_wig2 = @db.get_wig(@wig2.id)
    expect(retrieved_wig2.color).to eq 'blonde'
    expect(retrieved_wig2.length).to eq 'short'
    expect(retrieved_wig2.retail_estimate).to eq 300
  end

  it 'updates a wig' do
    @db.update_wig(@wig.id, {condition: "poor", tracking_number: 294723947})
    wig = @db.get_wig(@wig.id)
    expect(wig.condition).to eq "poor"
    expect(wig.tracking_number).to eq 294723947
  end

  it 'grabs all the wigs' do
    wigs = @db.all_wigs
    expect(wigs.count).to eq 2
    expect(wigs.map &:donor_id).to include @user.id
    expect(wigs.map &:color).to include 'blonde'
    expect(wigs.map &:length).to include 'long'
  end

  it 'deletes a wig' do
    expect(@db.all_wigs.count).to eq 2
    @db.delete_wig(@wig.id)
    expect(@db.get_wig(@wig.id)).to eq nil
    expect(@db.get_wig(@wig2.id)).to_not be_nil
  end

  after :each do
    @db.CLEAR_ALL
  end

end

describe Wigglez::Database::SQL do
  it_behaves_like 'a database'
end
