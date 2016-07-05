require "rails_helper"

RSpec.describe User, :type => :model do
  before(:all) do
    user = User.create(name: 'Bob', email: 'bob@dbc.com', password: 'password')
    admin = User.create(name: 'Bill', email: 'bill@dbc.com', password: 'password', admin: true)
  end

  context "existing users" do
    it "a user has a name" do
      expect(User.first.name).to eq ("Bob")
    end
    it "a user has an email" do
      expect(User.first.email).to eq ("bob@dbc.com")
    end
    # might have to use factory girl to test password
    # it "a user has a password" do
    #   expect(User.first.password).to_not eq (nil)
    # end
    it "a user has an admin attribute" do
      expect(User.first.admin).to eq (nil)
    end
  end

  context "existing admin" do
    it "an admin has a name" do
      expect(User.find_by(name: 'Bill').name).to eq ("Bill")
    end
    it "an admin has an email" do
      expect(User.find_by(name: 'Bill').email).to eq ("bill@dbc.com")
    end
    it "an admin has an admin attribute of true" do
      expect(User.find_by(name: 'Bill').admin).to be true
    end
  end

  context "new user" do
    before(:each) do
      billy = User.create(name: 'Billy', email: 'billy@dbc.com', password: 'password')
    end
    it "a user has a name" do
      expect(User.last.name).to eq ("Billy")
    end
    it "a user has an email" do
      expect(User.last.email).to eq ("billy@dbc.com")
    end

    it "a user has an admin attribute" do
      expect(User.last.admin).to be (nil)
    end
  end
end
