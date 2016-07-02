class Breed < ActiveRecord::Base
  belongs_to :species
  belongs_to :animal
  validates :name, presence: true
end
