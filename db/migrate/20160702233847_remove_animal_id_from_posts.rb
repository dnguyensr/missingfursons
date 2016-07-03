class RemoveAnimalIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :animal_id
  end
end
