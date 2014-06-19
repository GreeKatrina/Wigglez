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
    xit 'needs a password and confirmation to save' do
      u = @User.new(name: "Katrina", email: 'theo@gmail.com')
      u.save
      expect(u).to_not be_valid

      u.password = "password"
      u.password_confirmation = ""
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = "password"
      u.save
      expect(u).to be_valid
    end
    xit 'needs password and confirmation to match' do
      u = @User.create(
          name: "Katrina",
          email: 'theo@gmail.com',
          password: 'Hercules',
          password_confirmation: 'Hercules1'
        )
      expect(u).to_not be_valid
    end
    xit 'needs a password of atleast 6 characters to save' do
      u = @User.create(name: "Katrina", email: 'theo@gmail.com', password: 'test', password_confirmation: 'test')
      u.save
      expect(u).to_not be_valid
    end
    xit 'cannot have a password longer than 20 characters' do
      u = @User.create(name: "Katrina", email: 'theo@gmail.com', password: 'passwordpasswordpasswordpasswordpassword', password_confirmation: 'passwordpasswordpasswordpasswordpassword')
      u.save
      expect(u).to_not be_valid
    end
  end

  describe "authentitcation" do
    let(:user) { @User.create(
        name: 'Katrina',
        email: 'theo@gmail.com',
        password: 'Hercules',
        password_confirmation: 'Hercules'
      )}
    xit 'authenticates with a correct password' do
      expect(user.authenticate('Hercules')).to be
    end
    xit 'does not authenticate with an incorrect password' do
      expect(user.authenticate('Hercules1')).to_not be
    end
  end

  after :each do
    @db.CLEAR_ALL
  end

end
