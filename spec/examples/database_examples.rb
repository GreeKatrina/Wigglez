require 'spec_helper'

shared_examples 'a database' do

  before(:each) do
    @db = described_class.new
    @user = @db.create_user(
              name: "Katrina",
              email: 'theo@gmail.com',
              password: 'password1',
              password_confirmation: 'password1'
            )
    @wig = @db.create_wig(
              donor: @user.id,
              material: 'synthetic',
              color: 'brown',
              length: 'long',
              gender: 'female',
              retail_estimate: 400,
              condition: 'new',
              construction: 'custom',
              size: 'average'
            )
     @wig2 = @db.create_wig(
              donor: @user.id,
              material: 'synthetic',
              color: 'blonde',
              length: 'short',
              gender: 'female',
              retail_estimate: 300,
              condition: 'new',
              construction: 'custom',
              size: 'average'
            )
  end

  it 'creates a user ' do
    expect(@user.id).to_not be_nil
    expect(@user.name).to eq 'Katrina'
  end

  it 'gets a user by id' do
    user = @db.get_user(@user.id)
    expect(user.id).to eq @user.id
    expect(user.name).to eq @user.name
    expect(user.email).to eq @user.email
  end

  it 'retreives a user by email' do
    user = @db.get_user_by_email(@user.email)
    expect(user.name).to eq 'Katrina'
    expect(user.email).to eq 'theo@gmail.com'
  end

  it 'creates a session and returns its id' do
    session_id = @db.create_session(:user_id => @user.id)
    expect(session_id).to_not be_a Hash
  end

  it 'retreives a user by session id' do
    session_id = @db.create_session(:user_id => @user.id)
    user = @db.get_user_by_session_id(session_id)
    expect(user.name).to eq 'Katrina'
    expect(user.email).to eq 'theo@gmail.com'
  end

  it "allows a donor to create a wig" do
    expect(@wig).to_not be_nil
    expect(@wig.donor).to eq @user.id
    expect(@wig.material).to eq 'synthetic'
    expect(@wig.color).to eq 'brown'
    expect(@wig.length).to eq 'long'
    expect(@wig.gender).to eq 'female'
    expect(@wig.retail_estimate).to eq 400
    expect(@wig.condition).to eq 'new'
    expect(@wig.construction).to eq 'custom'
    expect(@wig.size).to eq 'average'
  end

  it 'retreives a wig' do
    wig = @db.get_wig(@wig.id)
    expect(wig.color).to eq 'brown'
    expect(wig.length).to eq 'long'
    expect(wig.retail_estimate).to eq 400

    wig2 = @db.get_wig(@wig2.id)
    expect(wig2.color).to eq 'blonde'
    expect(wig2.length).to eq 'short'
    expect(wig2.retail_estimate).to eq 300
  end

  it 'grabs all the wigs' do
    wigs = @db.all_wigs
    expect(wigs.count).to eq 2
    expect(wigs.map &:donor).to include @user.id
    expect(wigs.map &:color).to include 'blonde'
    expect(wigs.map &:length).to include 'long'
  end

  after(:each) do
    @db.CLEAR_ALL
  end

end
