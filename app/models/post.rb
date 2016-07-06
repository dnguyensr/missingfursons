class Post < ActiveRecord::Base
  include FacebookHelper
  include TwitterHelper
  require 'open-uri'

  belongs_to :user
  belongs_to :animal
  validates :location, presence: true
  after_initialize :set_default_found_status
  after_save :post_to_facebook, :post_to_twitter

  acts_as_mappable

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
      "link" => "http://missingfursons.com/posts/#{self.id}", # Change this to show page link
      "picture" => self.animal.image.url # Change this to s3 link
    })
  end

  def post_to_twitter
    get_post_information

    post_link = "https://missingfursons.com/posts/#{self.id}"

    twitter_client.update_with_media("Lost #{@species_name} #{@animal_name} in #{@location}, @missing_fursons - #{post_link}", open(self.animal.image.url))
  end

end
