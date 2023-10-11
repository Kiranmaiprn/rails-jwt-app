require 'rails_helper'

RSpec.describe User, type: :model do
  context "when creating a user" do
   
    

    let(:user) { build :user}
    let(:user1) {create :user, name: nil}
    let(:user2) {build :user, email: user.email}
    # it 'should be valid user with all attributes' do
    #      expect(user.valid?).to eq(true)
    # end
    it "should raise invalid record exception for duplicate email" do
      user.save
      expect(user2.save).to eq(false)
    end

    # it 'Should have name as email as name is nil' do
    #   expect(user1.name).to eq(user1.email)
    # end

    # it "should say hello world" do
    #   hw = User.new
    #   message = hw.say_hello
    #   expect(message).to eq "Hello World!"
      
      
    # end

    # it "should detect when a string contains vowels" do
    #   sa = User.new
    #   test = 'uuu'
    #   expect(sa.has_vowels? test).to be true
    # end

    # it "should detect when a string doesn't contain vowels" do
    #   sa = User.new
    #   test = 'bcdfg'
    #   expect(sa.has_vowels? test).to be false
    # end

    it "should show how the comparison Matchers" do
      a = 1
      b=2
      c=3
      d = 'test'

      expect(b).to be>a
      expect(a).to be >= a 
      expect(a).to be <= b
      expect(b).to be <= c
      expect(c).to be_between(1,3).inclusive
      expect(c).to be_between(1,4).exclusive
      expect(d).to match /TEST/i
    end
  end

  context 'validation test' do
    it 'ensures address' do
      user= User.new(name: "user1", email: "user1@mail").save
      expect(user).to eq(false)
    end

    it 'ensures email' do
      user = User.new(name: "user1", address: "suryapet").save
      expect(user).to eq(false)
    end

    it 'ensures name' do
      user = User.new(email: "user1@mail", address: "user1").save
      expect(user).to eq(false)
    end

    it 'saved successfully' do
      user = User.new(name: "user1", email: "user1@mail", address: "user1", password: 123456).save
      expect(user).to eq(true)
    end


  end
  
end
