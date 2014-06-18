require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe "User" do
  describe 'passwords' do
    it 'needs a password and confirmation to save' do
      u = Wigglez::Database::SQL::User.new(name: "Katrina",email: 'theo@gmail.com')
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
      u = Wigglez::Database::SQL::User.create(
          name: "Katrina",
          password: 'Hercules',
          password_confirmation: 'Hercules1'
        )
      expect(u).to_not be_valid
    end
  end
end
