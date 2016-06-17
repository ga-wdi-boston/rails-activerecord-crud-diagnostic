class AddAllValuesToLicencees < ActiveRecord::Migration
  def change
    add_column :licencees, :surname, :string
    add_column :licencees, :given_name, :string
    add_column :licencees, :gender, :string
    add_column :licencees, :height, :integer
    add_column :licencees, :weight, :integer
    add_column :licencees, :born_on, :date
    add_column :licencees, :eye_color, :string
    add_column :licencees, :hair_color, :string
  end
end
