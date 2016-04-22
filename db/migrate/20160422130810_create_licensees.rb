class CreateLicensees < ActiveRecord::Migration
  def change
    create_table :licensees do |t|
      t.text :surname
      t.text :given_name
      t.text :gender
      t.integer :height
      t.integer :weight
      t.date :born_on
      t.text :eye_color
      t.text :hair_color

      t.timestamps null: false
    end
  end
end
