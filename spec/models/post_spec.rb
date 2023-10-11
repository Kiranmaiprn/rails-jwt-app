require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "checking a valid post" do
    let! (:user1) {create :user, name: "user1", email: "user1@mail", address: "user1", password: 123456}
    let! (:post1) {create :post, name: "First Post", user_id: user1.id}
    it "name of post" do
      expect(post1.name).to eq("First Post")
    end

    it "validity checking" do
      expect(post1.valid?).to be(true)
    end

    it "validity checking of post without user" do
      post2 = Post.new(name: "Second Post").save
      expect(post2).to be(false)
    end

    it "handling error" do
      post3 = Post.new(name: "third Post")
      expect {post3.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
end
