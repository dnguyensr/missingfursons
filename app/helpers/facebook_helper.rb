module FacebookHelper

  def facebook_graph
    @facebook_graph ||= Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])
  end

end