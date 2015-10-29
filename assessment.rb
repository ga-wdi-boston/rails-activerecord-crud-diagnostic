require 'csv'
# Assessment answers to:

$ rails g model Licensee
      invoke  active_record
      create    db/migrate/20151029152942_create_licensees.rb
      create    app/models/licensee.rb

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

$ rake db:migrate
== 20151029152942 CreateLicensees: migrating ==================================
-- create_table(:licensees)
   -> 0.0058s
== 20151029152942 CreateLicensees: migrated (0.0059s) =========================

# question 2:

licensee = Licensee.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black')
p licensee

 id | surname | given_name | gender | height | weight |    dob     | eye_color | hair_color |         created_at         |         updated_at
----+---------+------------+--------+--------+--------+------------+-----------+------------+----------------------------+----------------------------
  1 | Bishop  | Caren      | f      |     63 |    132 | 1943-09-26 | Brown     | Black      | 2015-10-29 15:45:30.593732 | 2015-10-29 15:45:30.593732
  2 | Bishop  | Caren      | f      |     63 |    132 | 1943-09-26 | Brown     | Black      | 2015-10-29 15:46:08.507114 | 2015-10-29 15:46:08.507114
  3 | Bishop  | Caren      | f      |     63 |    132 | 1943-09-26 | Brown     | Black      | 2015-10-29 15:47:28.850618 | 2015-10-29 15:47:28.850618
(3 rows)

apparently I added Caren three times because I thought I was getting error messages

# question 3:

require 'csv'

namespace :db do
  namespace :populate do

    desc 'Fill the licensees table with data'
    task licensee: :environment do
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

# question 5:

# question 6:
