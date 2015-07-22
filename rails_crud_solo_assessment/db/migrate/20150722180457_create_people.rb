class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t. :name
      t.string :title
      t.string :quote
      t.string :age

      t.timestamps null: false
    end
  end
end
