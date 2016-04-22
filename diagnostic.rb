require 'csv'
# Diagnostic answers to:
class Licenesees < ActiveRecord::Base
end

class CreateLicensees <ActiveRecord::Migration
  def change
    create table :licensees do |t|
      t.text :surname
      t.text :given_name
      t.text :gender
      t.integer :height
      t.integer :weight
      t.date :born_on
      t.text :eye_color
      t.text :hair_color
    end
  end
end
# question 2:
Licensee.create!(surname: "Bishop", given_name: "Caren", gender: "f", height: 63,
weight: 132, born_on: "1943-0-26", eye_color: "Brown", hair_color: "Black")
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:
SELECT licensees
FROM Licensees
WHERE 
# question 5:
