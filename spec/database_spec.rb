require 'spec_helper'
require 'pry'

describe 'Wigglez database singleton' do
  it "always returns the same object" do
    database1 = Wigglez.db
    database2 = Wigglez.db
    # Create some data just in case
    database1.create_wig(
      donor_id: 1,
      material: 'synthetic',
      color: 'brown',
      length: 'long',
      gender: 'female',
      retail_estimate: 400,
      condition: 'new',
      construction: 'custom',
      size: 'average'
    )

    # They should still be equal
    expect(database1).to eq database2
  end

  it "resets for every test" do
# binding.pry
    expect(Wigglez.db.all_wigs.count).to eq 0
  end
end


