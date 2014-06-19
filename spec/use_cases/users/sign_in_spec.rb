require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe Wigglez::SignIn do
  before(:each) do
    @db = Wigglez.db
    @SignIn = Wigglez::SignIn.new
    Wigglez::SignUp.new.run({ name: 'Katrina', email: 'theo@gmail.com', password: 'password', password_confirmation: 'password' })
    @User = { email: 'theo@gmail.com', password: 'password' }
  end

  describe 'email' do
    it 'must be associated with a user' do
      @User[:email] = "smith@gmail.com"
      result = @SignIn.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :email => ["No user associated with that email"]

      @User[:email] = 'theo@gmail.com'
      result = @SignIn.run(@User)
      expect(result.success?).to eq true
    end
  end

  describe 'password' do
    it 'must be correct' do
      @User[:password] = 'not_password'
      result = @SignIn.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :password => ["Incorrect password"]

      @User[:password] = 'password'
      result = @SignIn.run(@User)
      expect(result.success?).to eq true
    end
  end

  after :each do
    @db.CLEAR_ALL
  end

end
