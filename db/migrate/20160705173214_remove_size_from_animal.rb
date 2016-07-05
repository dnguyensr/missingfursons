class RemoveSizeFromAnimal < ActiveRecord::Migration
  def change
    remove_column :animals, :size, :integer
  end
end
