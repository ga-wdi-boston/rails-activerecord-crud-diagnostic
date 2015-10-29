require 'csv'
# Assessment answers to:
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
bishop = Person.create surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: Brown, hair_color: 'Black'

# question 3:
require 'csv'
namespace :db do
  namespace :populate do
    desc 'Fill the licensees table with example data'
    task licensees: :environment do
      City.transaction do
        #pass in the file that has the data we want to load
        CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |licensee_row|
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! licensee
        end
      end
    end

# question 4:

# Use ActiveRecord to retrieve all the licensees with Hazel eye color and Brown or Black hair color.

licensees = Licensee.find(:eye_color => 'Hazel' AND :hair_color => 'Brown' OR :eye_color = >'Hazel' AND :hair_color => 'Black')

# question 5:
# Use ActiveRecord to make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

Licensee.transaction do
  licensees = Licensee.all
  licensees.each do |licensee|
    if licensee.surname = 'Escobar'
      licensee.height -= 1
    if licensee.surname = 'Whaley'
      licensee.height -= 1
    end
  end

# question 6:
# ActiveRecord to remove Dylan Rich and Teresita Myers from the table of licensees.
rich = Licensee.find_by! surname: 'Rich'
rich.destroy!

myers = Licensee.find_by! surname: 'Myers'
myers.destroy!
