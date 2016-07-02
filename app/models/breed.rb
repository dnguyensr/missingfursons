class Breed < ActiveRecord::Base
  has_many :species
  belongs_to :animal
  validates :name, presence: true
end
