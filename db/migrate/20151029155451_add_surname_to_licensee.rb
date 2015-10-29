class AddSurnameToLicensee < ActiveRecord::Migration
  def change
    add_column :licensees, :surname, :string
  end
end
