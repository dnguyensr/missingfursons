class AddPostIdToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :post_id, :integer
  end
end
