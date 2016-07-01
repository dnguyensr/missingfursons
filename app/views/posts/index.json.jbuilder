json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :animal_id, :found_status, :location, :phone, :email
  json.url post_url(post, format: :json)
end
