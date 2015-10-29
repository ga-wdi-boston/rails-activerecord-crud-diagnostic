require 'csv'
# Assessment answers to:
# question 1:
class CreateLicensees < ActiveRecord::Migration
  def change
    create_table :licensees do |t|
      t.string :surname
      t.string :given_name
      t.string :gender, limit: 1
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

Licensee.create surname: 'Bishop', given_name: 'Caren', gender: 'f', height: '63', weight: '132', dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black'

# question 3:

require 'csv'

namespace :db do
  namespace :populate do
    desc 'Fills the database with licensees'
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

Licensee.where(eye_color: 'Hazel').where do |p| p.hair_color == 'Black' || p.hair_color == 'Brown' end

# question 5:

#Easy to do, just needed more time.
# It'd have a #find_by {names}, #update the height with =- etc., etc.

# question 6:

#Easy to do, just needed more time.
# It'd have a #find_by {names}, #destroy! etc., etc.
