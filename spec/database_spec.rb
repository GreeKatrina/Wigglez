require 'spec_helper'
require 'pry'

describe 'Wigglez database singleton' do

  before :each do
    @database1 = Wigglez.db
    @database2 = Wigglez.db
  end

  it "always returns the same object" do
    # Create some data just in case
    @database1.create_wig(
      donor_id: 1,
      material: 'synthetic',
      color: 'brown',
      length: 'long',
      gender: 'female',
      retail_estimate: 400,
      condition: 'used',
      construction: 'custom',
      size: 'average'
    )

    # They should still be equal
    expect(@database1).to eq @database2
    expect(@database1.all_wigs.count).to eq 1
  end

  it "resets for every test" do
    expect(Wigglez.db.all_wigs.count).to eq 0
  end

  after :each do
    Wigglez.db.CLEAR_ALL
  end
end


