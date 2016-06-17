class CreateLicencees < ActiveRecord::Migration
  def change
    create_table :licencees do |t|

      t.timestamps null: false
    end
  end
end
