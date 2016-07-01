class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.integer :breed_id
      t.string :name
      t.string :color
      t.text :additional_notes
      t.attachment :image
      t.integer :age
      t.integer :size

      t.timestamps null: false
    end
  end
end
