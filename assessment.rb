require 'csv'
# Assessment answers to:

# question 2:
licensee = licensee.create( surname: 'Bishop', given_name: 'Caren', height: 63, weight: 132, dob: '1943-09-26', gender: 'f')
p licensee
# question 3:
class CreateLicensees < ActiveRecord::Migration
  def change
    create_table :licensees do |t|
      t.string :surname
      t.string :given_name
      t.string :gender
      t.integer :height
      t.integer :weight
      t.date :dob
      t.string :eye_color
      t.string :hair_color

      t.timestamps null: false
    end
  end
end
# question 4:



# question 5:




# question 6:
'Rich' = Person.find_by! surname: 'Rich'

mich.destroy!

Myers = Person.find_by! surname: 'Myers'

myers.destroy!

