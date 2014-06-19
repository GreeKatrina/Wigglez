require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe Wigglez::SignUp do
  before(:each) do
    @db = Wigglez.db
    @SignUp = Wigglez::SignUp.new
    @User = { name: 'Katrina', email: 'theo@gmail.com', password: 'password', password_confirmation: 'password' }
  end

  describe 'name' do
    it 'cannot be blank' do
      @User[:name] = ""
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :name => ["can't be blank"]

      @User[:name] = "Katrina"
      result = @SignUp.run(@User)
      expect(result.success?).to eq true
    end
    it 'cannot have a name longer than 50 characters' do
      u = @User[:name] = "KatrinaKatrinaKatrinaKatrinaKatrinaKatrinaKatrinaKatrina"
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :name => ["is too long (maximum is 50 characters)"]
    end
  end

  describe 'email' do
    it 'needs a valid email' do
      @User[:email] = ""
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :email => ["can't be blank", "is invalid"]

      @User[:email] = 'theo'
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :email => ["is invalid"]

      @User[:email] = 'theo@gmail'
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :email => ["is invalid"]

      @User[:email] = 'theo@gmail.com'
      result = @SignUp.run(@User)
      expect(result.success?).to eq true
    end
    it 'should downcase the email' do
      @User[:email] =  'ThEo@GmAiL.cOm'
      result = @SignUp.run(@User)
      expect(result.success?).to eq true
      expect(result.user.email).to eq 'theo@gmail.com'
      expect(result.user.email).to_not eq 'ThEo@GmAiL.cOm'
    end
  end

  describe 'passwords' do
    it 'needs a password and confirmation to save' do
      @User[:password] = ""
      @User[:password_confirmation] = ""
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :password => ["can't be blank", "is too short (minimum is 6 characters)"]

      @User[:password] = "password"
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :password_confirmation => ["doesn't match Password"]

      @User[:password_confirmation] = "password"
      result = @SignUp.run(@User)
      expect(result.success?).to eq true
    end
    it 'needs password and confirmation to match' do
      @User[:password_confirmation] = "not_password"
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :password_confirmation => ["doesn't match Password"]
    end
    it 'needs a password of atleast 6 characters to save' do
      @User[:password] = 'test'
      @User[:password_confirmation] = 'test'
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :password => ["is too short (minimum is 6 characters)"]
    end
    it 'cannot have a password longer than 20 characters' do
      @User[:password] = 'passwordpasswordpasswordpasswordpassword'
      @User[:password_confirmation] = 'passwordpasswordpasswordpasswordpassword'
      result = @SignUp.run(@User)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :password => ["is too long (maximum is 20 characters)"]
    end
  end

  after :each do
    @db.CLEAR_ALL
  end

end
