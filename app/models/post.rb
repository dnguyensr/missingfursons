class Post < ActiveRecord::Base
  belongs_to :user
  has_one :animal
  validates :location, presence: true
  after_initialize :set_default_found_status

  def set_default_found_status
    self.found_status = false
  end
end
