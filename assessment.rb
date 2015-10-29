require 'csv'
# Assessment answers to:

# question 1:
rails g model Licensee

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

# `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black`

# question 3:
require 'csv'

namespace :db do
  namespace :populate do
    desc 'Fill the database with example data'
    task all: [:licensees]

    desc 'Fill the people table with example data'
    task licensees: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv',
            headers: true) do |licensee_row|
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! Licensee
        end
      end
    end
  end
end

# question 4:

Licensee.find_by(eye_color: 'Hazel', hair_color: 'Black' OR 'Brown')

# question 5:

# I ran out of time, but would base my answer off of what we did in class here:
grant = Person.find_by! surname: 'Grant'

grant.update! weight: 135

grant.weight -= 5

grant.save!

# question 6:
# I ran out of time, but would base my answer off of what we did in class here:
grant = Person.find_by! surname: 'Grant'

grant.destroy!

