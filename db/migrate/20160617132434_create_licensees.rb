class CreateLicensees < ActiveRecord::Migration
  def change
    create_table :licensees do |t|
      add_column :surname, :given_name, :gender, :height, :weight, :born_on, :eye_color, :hair_color
      t.timestamps null: false
    end
  end
end
