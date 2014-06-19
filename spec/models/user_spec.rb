require 'spec_helper'
require 'pry-byebug'

# describe "User" do
#   before(:each) do
#     @db = Wigglez.db.new
#     @User = FactoryGirl.create(:user)
#   end

#   describe 'name' do
#     xit 'needs a name to save' do
#       u = @User.new(name: "", email: 'theo@gmail.com', password: "password", password_confirmation: "password")
#       u.save
#       expect(u).to_not be_valid

#       u.name = "Katrina"
#       u.save
#       expect(u).to be_valid
#     end
#     xit 'cannot have a name longer than 50 characters' do
#       u = @User.new(name: "KatrinaKatrinaKatrinaKatrinaKatrinaKatrinaKatrinaKatrina", email: 'theo@gmail.com', password: 'password', password_confirmation: 'password')
#       u.save
#       expect(u).to_not be_valid
#     end
#   end

#   describe 'email' do
#     xit 'needs a valid email to save' do
#       u = @User.new(name: "Katrina", email: "", password: "password", password_confirmation: "password")
#       u.save
#       expect(u).to_not be_valid

#       u.email = 'theo'
#       u.save
#       expect(u).to_not be_valid

#       u.email = 'theo@gmail'
#       u.save
#       expect(u).to_not be_valid

#       u.email = 'theo@gmail.com'
#       u.save
#       expect(u).to be_valid
#     end
#     xit 'should downcase the email after save' do
#       u = @User.new(name: "Katrina", email: 'ThEo@GmAiL.cOm', password: 'password', password_confirmation: 'password')
#       u.save
#       expect(u.email).to eq 'theo@gmail.com'
#       expect(u.email).to_not eq 'ThEo@GmAiL.cOm'
#     end
#   end

#   describe 'passwords' do
#     xit 'needs a password and confirmation to save' do
#       u = @User.new(name: "Katrina", email: 'theo@gmail.com')
#       u.save
#       expect(u).to_not be_valid

#       u.password = "password"
#       u.password_confirmation = ""
#       u.save
#       expect(u).to_not be_valid

#       u.password_confirmation = "password"
#       u.save
#       expect(u).to be_valid
#     end
#     xit 'needs password and confirmation to match' do
#       u = @User.create(
#           name: "Katrina",
#           email: 'theo@gmail.com',
#           password: 'Hercules',
#           password_confirmation: 'Hercules1'
#         )
#       expect(u).to_not be_valid
#     end
#     xit 'needs a password of atleast 6 characters to save' do
#       u = @User.create(name: "Katrina", email: 'theo@gmail.com', password: 'test', password_confirmation: 'test')
#       u.save
#       expect(u).to_not be_valid
#     end
#     xit 'cannot have a password longer than 20 characters' do
#       u = @User.create(name: "Katrina", email: 'theo@gmail.com', password: 'passwordpasswordpasswordpasswordpassword', password_confirmation: 'passwordpasswordpasswordpasswordpassword')
#       u.save
#       expect(u).to_not be_valid
#     end
#   end

#   describe "authentitcation" do
#     let(:user) { @User.create(
#         name: 'Katrina',
#         email: 'theo@gmail.com',
#         password: 'Hercules',
#         password_confirmation: 'Hercules'
#       )}
#     xit 'authenticates with a correct password' do
#       expect(user.authenticate('Hercules')).to be
#     end
#     xit 'does not authenticate with an incorrect password' do
#       expect(user.authenticate('Hercules1')).to_not be
#     end
#   end

#   after(:each)do
#     @db.CLEAR_ALL
#   end

# end
