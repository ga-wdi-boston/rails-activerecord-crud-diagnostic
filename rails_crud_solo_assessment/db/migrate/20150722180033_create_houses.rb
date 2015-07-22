class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :model
      t.string :sigil

      t.timestamps null: false
    end
  end
end
