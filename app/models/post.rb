class Post < ActiveRecord::Base
  include FacebookHelper
  include TwitterHelper

  belongs_to :user
  belongs_to :animal
  validates :location, presence: true
  after_initialize :set_default_found_status
  # after_save :post_to_facebook, :post_to_twitter

  def set_default_found_status
    self.found_status = false
  end

  private

  def get_post_information
    @species_name = self.animal.breed.species.name
    @location = self.location
    @animal_name = self.animal.name
  end

  def post_to_facebook
    get_post_information

    facebook_graph.put_wall_post("Lost #{@species_name} #{@animal_name} in #{@location} \#MissingFursons", {
      "name" => "Have you seen our #{@species_name} #{@animal_name}?",
      "link" => "http://missingfursons.com", # Change this to show page link
      "picture" => "http://i.imgur.com/l3qFZIu.jpg" # Change this to s3 link
    })
  end

  def post_to_twitter
    get_post_information
    twitter_client.update("Lost #{@species_name} #{@animal_name} in #{@location}, @missing_fursons")
  end

end
