class Animal < ActiveRecord::Base
  has_many :breeds
  validates :name, :color, :size, presence: true
end
