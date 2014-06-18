require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe "User" do
  describe 'passwords' do
    it 'needs a password and confirmation to save' do
      u = Wigglez::Database::SQL::User.new(name: "Katrina",email: 'theo@gmail.com')
      u.save
      expect(u).to_not be_valid
    end
  end
end
