class AddDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :date, :date, null: false
  end
end
