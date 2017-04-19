class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :animal_id
      t.boolean :found_status
      t.date    :date
      t.string :location
      t.string :phone
      t.string :email
      t.date :date

      t.timestamps null: false
    end
  end
end
