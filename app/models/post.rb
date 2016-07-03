class Post < ActiveRecord::Base
  include FacebookHelper
  include TwitterHelper

  belongs_to :user
  has_one :animal
  validates :location, presence: true
  after_initialize :set_default_found_status
  after_save :post_to_facebook, :post_to_twitter

  def set_default_found_status
    self.found_status = false
  end

  private

  def post_to_facebook
    facebook_graph.put_wall_post("Help! My dog is lost! \#MissingFursons", {
      "name" => "Have you seen him?",
      "link" => "http://missingfursons.com",
      "picture" => "http://i.imgur.com/fjXJEz1.jpg"
    })
  end

  def post_to_twitter
    twitter_client.update("Lost dog in ZIP, @missing_fursons")
  end

end
