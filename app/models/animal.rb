class Animal < ActiveRecord::Base
  has_one :post
  belongs_to :breed
  # belongs_to :species
  belongs_to :user
  validates :name, :color, presence: true
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
