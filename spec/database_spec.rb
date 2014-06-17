require 'spec_helper'

describe 'Wigglez database singleton' do
  it "always returns the same object" do
    database1 = Wigglez.db
    database2 = Wigglez.db
    # Create some data just in case
    # database1.create_user(:email => 'email', :password => 'test')

    # They should still be equal
    expect(database1).to eq database2
  end

  xit "resets for every test" do
    expect(Wigglez.db.all_wigs.count).to eq 0
  end
end

describe Wigglez::Database::SQL do
  it_behaves_like 'a database'
end
