class ChangeLatLongOnPosts < ActiveRecord::Migration
  def change
    change_column :posts, :lat, 'decimal USING CAST(lat AS decimal)'
    change_column :posts, :lng, 'decimal USING CAST(lng AS decimal)'
  end
end
