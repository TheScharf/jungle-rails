require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it "saves a user" do
      @user = User.create(name: "Bob", email: "123@123.com", password: "1234", password_confirmation: "1234")
      expect(@user).to be_valid
    end
    it "gives error with no name" do
      @user = User.create(name: nil, email: "abc@123.com", password: "abcd", password_confirmation: "abcd")
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "gives error with no email" do
      @user = User.create(name: "Larry", email: nil, password: "word", password_confirmation: "word")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "gives error when passwords do not match" do
      @user = User.create(name: "Sophia", email: "the@one.com", password: "love", password_confirmation: "loved")
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "gives error when passwords do not match" do
      @user = User.create(name: "Sophia", email: "the@one.com", password: "loved", password_confirmation: "loves")
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "no error for case sensitivity" do
      @user = User.create(name: "Lori", email: "AppLe.Com", password: "seed", password_confirmation: "seed")
      expect(@user).to be_valid
    end
    it "no error for email whitespace" do
      @user = User.create(name: "Pepper", email: "   andsalt.com", password: "food", password_confirmation: "food")
      expect(@user).to be_valid
    end
    it "gives error when password is too short" do
      @user = User.create(name: "TheDog", email: "woof.com", password: "l", password_confirmation: "l")
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
    end
    it "gives error when email is already taken" do
      @user = User.create(name: "Sophia", email: "the@one.com", password: "love", password_confirmation: "love")
      @user2 = User.create(name: "OtherUser", email: "the@one.com", password: "user", password_confirmation: "user")
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
  end
end
