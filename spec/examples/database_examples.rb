require 'spec_helper'

shared_examples 'a database' do

  let(:db) { described_class.new }
  # let(wig) { db.create_wig()}

  xit "creates a user" do
    user = db.create_user(email: 'test@gmail.com', password: 'test')
    expect(user.id).to_not be_nil
    expect(user.email).to eq 'test@gmail.com'
    expect(user.password).to eq 'test'
  end

  xit "creates a wig" do
    wig = db.create_wig()
  end

end
