require 'csv'
# Assessment answers to:
# bin/rails generate model Licensee

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

# question 2:
person = Person.create  surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'black'
# question 3:

# question 4:

# question 5:

# question 6:
