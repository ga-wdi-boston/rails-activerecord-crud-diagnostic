require 'csv'
# Assessment answers to:

# question 1:

rake db:create
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

# this worked

Licensee.create surname: 'Bishop', given_name: 'Karen', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black'

# question 3:

# got this error when
# ~/WDI/Assessments/rails-crud-assessment (response)$ rake db:migrate:licensees
# rake aborted!
# Don't know how to build task 'db:migrate:licensees'
# my rake.db is in lib/tasks/db.rake, following procedure from rails-crud lesson, and everything else is the same from the lesson.
# just being honest here.

require 'csv'

namespace :db do
  namespace :populate do
    desc 'Fill the licensee table with CSV data'
    task licensees: :environment do
      Licensee.transaction Yah do
        CSV.foreach(Rails.root + 'data/licensees.csv',
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

Licensee.where(eye_color: 'Hazel', hair_color: 'Black')

# question 5:

chris = Licensee.where(surname: 'Whaley', given_name: 'Chris')
chris.update! height -= 1
chris.save!

marilynn = Licensee.where(surname: 'Escobar', given_name: 'Marilynn')
marilynn.update! height -= 1
marilynn.save!

# question 6:

dylan = Licensee.where(surname: 'Rich', given_name: 'Dylan')
dylan.destroy!

teresita = Licensee.where(surname: 'Myers', given_name: 'Teresita')
teresita.destroy!
