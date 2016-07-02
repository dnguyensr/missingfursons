class Animal < ActiveRecord::Base
  has_many :breeds
  validates :name, :color, :size, presence: true
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
