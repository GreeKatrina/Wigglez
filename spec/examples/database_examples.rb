require 'spec_helper'

shared_examples 'a database' do

  before(:each) do
    @db = described_class.new
    @wig = @db.create_wig(
              donor: 1,
              material: 'synthetic',
              color: 'brown',
              length: 'long',
              gender: 'female',
              retail_estimate: 400,
              condition: 'new',
              construction: 'custom',
              size: 'average'
            )
    @user = @db.create_user(
              name: "Katrina",
              email: 'theo@gmail.com',
              password: 'password1',
              password_confirmation: 'password1'
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

  it "allows a donor to create a wig" do
    expect(@wig).to_not be_nil
    expect(@wig.donor).to eq 1
    expect(@wig.material).to eq 'synthetic'
    expect(@wig.color).to eq 'brown'
    expect(@wig.length).to eq 'long'
    expect(@wig.gender).to eq 'female'
    expect(@wig.retail_estimate).to eq 400
    expect(@wig.condition).to eq 'new'
    expect(@wig.construction).to eq 'custom'
    expect(@wig.size).to eq 'average'
  end

  after(:each) do
    @db.CLEAR_ALL
  end

end
