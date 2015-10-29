class AddColumnsToLicensees < ActiveRecord::Migration
  def change
    add_column :licensees, :given_name, :string
    add_column :licensees, :gender, :string
    add_column :licensees, :height, :string
    add_column :licensees, :weight, :integer
    add_column :licensees, :dob, :date
    add_column :licensees, :eye_color, :string
    add_column :licensees, :hair_color, :string
  end
end
