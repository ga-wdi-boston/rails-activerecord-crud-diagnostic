class AddCarenBishopToLicensees < ActiveRecord::Migration
  def change
    add_column :licensees, :surname, :string
    add_column :licensees, :given_name, :string
    add_column :licensees, :gender, :string
    add_column :licensees, :height, :integer
    add_column :licensees, :weight, :integer
    add_column :licensees, :born_on, :date
    add_column :licensees, :eye_color, :string
    add_column :licensees, :hair_color, :string
  end
end
