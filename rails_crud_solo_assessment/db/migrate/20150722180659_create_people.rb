class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :title
      t.string :quote
      t.string :image
      t.integer :age

      t.timestamps null: false
    end
  end
end
