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

licensee = Licensee.create surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black'
p licensee

# question 3:

namespace :db do
  namespace :populate do
    desc 'Fill the licensees table with example data'
    task licensees: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv',
                    headers: true) do | licensee_row |
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! licensee
        end
      end
    end
  end
end

# question 4:

Licensee.all.select do |l|
  l.eye_color == 'Hazel'
  and l.hair_color == 'Brown'
    or l.hair_color == 'Black'
end

# question 5:

marilynn = Licensee.find_by! surname: 'Escobar', given_name: 'Marilynn'
chris = Licensee.find_by! surname: 'Whaley', given_name: 'Chris'

marilynn.update! height -= 1
chris.update! height -= 1

marilynn.save!
chris.save!

# question 6:

dylan = Licensee.find_by! surname: 'Rich', given_name: 'Dylan'
teresita = Licensee.find_by! surname: 'Myers', given_name: 'Teresita'

teresita.destroy!
