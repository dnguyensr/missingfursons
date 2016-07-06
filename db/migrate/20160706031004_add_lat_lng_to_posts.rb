class AddLatLngToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :lat, :string
    add_column :posts, :lng, :string
  end
end
