require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user_no_username) {User.new(email:"email@email.com", password:"123456")}
	let(:user_no_email) {User.new(username:"username", password:"123456")}
	let(:user_no_password) {User.new(email:"email@email.com", username:"username")}
	let(:user) {User.new(email:"email@email.com", username:"username", password:"123456")}
	describe 'validations' do
		context 'will raise an error' do
			it 'has no username' do
				user_no_username.save
				expect(user_no_username.errors[:username]).to include("can't be blank")
			end
			it 'has no email' do
				user_no_email.save
				expect(user_no_email.errors[:email]).to include("can't be blank")
			end	
			it 'has no password' do
				user_no_password.save
				expect(user_no_password.errors[:password]).to include("can't be blank")
			end	
			it 'has a password that is too short' do
				user = User.new(password:"123")
				user.save
				expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
			end		


		end
	end

	describe '#password_digest' do
	  it "has a password" do
	  	user = User.new
	  	user.password= 'passoword'
	  	expect(user.password_digest).to be_a String
	  	end

	end

	
end

