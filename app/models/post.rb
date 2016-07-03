class Post < ActiveRecord::Base
  include FacebookHelper

  belongs_to :user
  has_one :animal
  validates :location, presence: true
  after_initialize :set_default_found_status
  after_save :post_to_facebook

  def set_default_found_status
    self.found_status = false
  end

  def post_to_facebook
    facebook_graph.put_wall_post("Help! My dog is lost! \#MissingFursons", {
      "name" => "Have you seen him?",
      "link" => "http://missingfursons.com",
      "picture" => "http://i.imgur.com/fjXJEz1.jpg"
    })
  end

end
