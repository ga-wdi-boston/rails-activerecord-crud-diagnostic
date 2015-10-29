require 'csv'
# Assessment answers to:
class CreateCities < ActiveRecord::Migration
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

Licensee.create(surname: 'Bishop' ,given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown',hair_color: Black)
l licensee

# question 3:

namespace :db do
  namespace :populate do
    desc 'Fill the licensees table with data'
    task licensees: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |licensee_row|
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! licensee
        end
      end
    end
  end
end

# question 4:
ran out of time

# question 5:

person = Person.find_by! given_name: 'Grant'

person.update! height: 63, 54

grant.weight -= 1

grant.save!

# question 6:
person = Person.find_by! given_name: 'Dylan Rich',
person = Person.find_by! given_name: 'Teresita Myers'
person.destroy!
