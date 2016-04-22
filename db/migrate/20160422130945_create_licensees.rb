class CreateLicensees < ActiveRecord::Migration
  def change
    create_table :licensees do |t|
      
      t.timestamps null: false
    end
  end
end
