require "rails_helper"

RSpec.describe Animal, :type => :model do
  before(:all) do
    dog = Animal.create(breed_id: 1, name: "doge", color: "gold", additional_notes: "additional notes", age: 3)
    # cat = User.create(name: 'Bill', email: 'bill@dbc.com', password: 'password', admin: true)
  end

  context "existing pet" do
    it "a pet has a name" do
      expect(Animal.first.name).to eq ("doge")
    end
    it "a pet has an color" do
      expect(Animal.first.color).to eq ("gold")
    end
    it "a pet has an age" do
      expect(Animal.first.age).to eq 3
    end
    it "a pet has a additional notes" do
      expect(Animal.first.additional_notes).to eq ("additional notes")
    end
  end
end
