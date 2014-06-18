require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe "User" do
  before(:each) do
    @User = Wigglez::Database::SQL::User
  end

  describe 'name' do
    it 'needs a name to save' do
      u = @User.new(name: "",email: 'theo@gmail.com', password: "password", password_confirmation: "password")
      u.save
      expect(u).to_not be_valid

      u.name = "Katrina"
      u.save
      expect(u).to be_valid
    end
  end

  describe 'passwords' do
    it 'needs a password and confirmation to save' do
      u = @User.new(name: "Katrina",email: 'theo@gmail.com')
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
    it 'needs password and confirmation to match' do
      u = @User.create(
          name: "Katrina",
          password: 'Hercules',
          password_confirmation: 'Hercules1'
        )
      expect(u).to_not be_valid
    end
  end

  describe "authentitcation" do
    let(:user) { @User.create(
        name: 'Katrina',
        password: 'Hercules',
        password_confirmation: 'Hercules'
      )}
    it 'authenticates with a correct password' do
      expect(user.authenticate('Hercules')).to be
    end
    it 'does not authenticate with an incorrect password' do
      expect(user.authenticate('Hercules1')).to_not be
    end
  end

end
