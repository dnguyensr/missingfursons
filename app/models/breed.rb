class Breed < ActiveRecord::Base
  has_many :animals
  belongs_to :species
  validates :name, presence: true
end
