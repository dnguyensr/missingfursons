require "rails_helper"

RSpec.describe Post, :type => :model do
  before(:all) do
    user = User.create(name: 'Bob', email: 'bob@dbc.com', password: 'password')
    dog = Animal.create(breed_id: 1, name: "doge", color: "gold", additional_notes: "additional notes", age: 3)
    post = Post.create(user_id: 1, animal_id: 1, location: 92101, phone: "1234567890", email: "a@a.com")
    # cat = User.create(name: 'Bill', email: 'bill@dbc.com', password: 'password', admin: true)
  end

  context "existing post" do
    it "a post has a user id" do
      expect(Post.user_id).to eq 1
    end
    it "a post has an animal id" do
      expect(Post.first.animal_id).to eq 1
    end
    it "a post has an location" do
      expect(Post.first.location).to eq 92101
    end
    it "a post has a phone number" do
      expect(Post.first.phone number).to eq ("1234567890")
    end
    it "a post has an email" do
      expect(Post.first.email).to eq ("a@a.com")
    end
  end
end
