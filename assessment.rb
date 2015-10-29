require 'csv'
# question 1:

class CreateLicensees < ActiveRecord::Migration
  def change
    create_table :licensee do |t|
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

licensee = Licensee.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 131, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black')
p licensee

# question 3:

namespace :db do
  namespace :populate do
    desc 'fill the licensee table with example data'
    task people: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensee.csv',
                    headers: true) do |licensee_row|
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
        Licensee.create! licensee
          end
        end
      end
    end
  end

# question 4:

licensee.where(licensee.eye_color = 'Hazel'), (licensee.hair_color = 'Brown' OR 'Black')

# question 5:

escobar = Licensee.find_by! surname: 'Escobar', given_name: 'Marilynn'

escobar.height -= 1

escobar.save!

whaley = Licensee.find_by! surname: 'Whaley', given_name: 'Chris'

whaley.height -= 1

whaley.save!

# question 6:

rich = Person.find_by! surname: 'Rich', given_name: 'Dylan'

rich.destroy!

myers = Person.find_by! surname: 'Myers', given_name: 'Teresita'

myers.destroy!
