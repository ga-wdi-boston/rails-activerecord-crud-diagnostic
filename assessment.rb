require 'csv'
# Assessment answers to:


# $ rails g model Licensee
#       invoke  active_record
#       create    db/migrate/20151029152942_create_licensees.rb
#       create    app/models/licensee.rb


# class CreateLicensees < ActiveRecord::Migration
#   def change
#     create_table :licensees do |t|
#       t.string :surname
#       t.string :given_name
#       t.string :gender
#       t.integer :height
#       t.integer :weight
#       t.date :dob
#       t.string :eye_color
#       t.string :hair_color

#       t.timestamps null: false
#     end
#   end
# end


# $ rake db:migrate
# == 20151029152942 CreateLicensees: migrating ==================================
# -- create_table(:licensees)
#    -> 0.0055s
# == 20151029152942 CreateLicensees: migrated (0.0055s) =========================




# question 2:

# $ rails c
# > licensee = Licensee.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black')
#    (0.1ms)  BEGIN
#   SQL (0.7ms)  INSERT INTO "licensees" ("surname", "given_name", "gender", "height", "weight", "dob", "eye_color", "hair_color", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING "id"  [["surname", "Bishop"], ["given_name", "Caren"], ["gender", "f"], ["height", 63], ["weight", 132], ["dob", "1943-09-26"], ["eye_color", "Brown"], ["hair_color", "Black"], ["created_at", "2015-11-06 21:28:35.563371"], ["updated_at", "2015-11-06 21:28:35.563371"]]
#    (0.3ms)  COMMIT
# => #<Licensee id: 1, surname: "Bishop", given_name: "Caren", gender: "f", height: 63, weight: 132, dob: "1943-09-26", eye_color: "Brown", hair_color: "Black", created_at: "2015-11-06 21:28:35", updated_at: "2015-11-06 21:28:35">


# $ rails db
# =# select * from licensees;
#  id | surname | given_name | gender | height | weight |    dob     | eye_color | hair_color |         created_at         |         updated_at
# ----+---------+------------+--------+--------+--------+------------+-----------+------------+----------------------------+----------------------------
#   1 | Bishop  | Caren      | f      |     63 |    132 | 1943-09-26 | Brown     | Black      | 2015-11-06 21:28:35.563371 | 2015-11-06 21:28:35.563371
# (1 row)




# question 3:

CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |row|
  licensee = row.to_hash
  unless Licensee.exists? licensee
    Licensee.create! licensee
  end
end


# rails-crud-assessment_development=# select * from licensees;
#  id |  surname  | given_name | gender | height | weight |    dob     | eye_color | hair_color |         created_at         |         updated_at
# ----+-----------+------------+--------+--------+--------+------------+-----------+------------+----------------------------+----------------------------
#   1 | Bishop    | Caren      | f      |     63 |    132 | 1943-09-26 | Brown     | Black      | 2015-11-06 21:28:35.563371 | 2015-11-06 21:28:35.563371
#   2 | Fletcher  | Cecile     | f      |     58 |    129 | 1953-05-03 | Brown     | Black      | 2015-11-06 21:46:48.968449 | 2015-11-06 21:46:48.968449
#   3 | Bray      | Bradly     | m      |     67 |    150 | 1955-04-16 | Blue      | Brown      | 2015-11-06 21:46:48.973279 | 2015-11-06 21:46:48.973279
#   4 | Mercer    | Jeff       | m      |     59 |    120 | 1992-07-29 | Brown     | Black      | 2015-11-06 21:46:48.976246 | 2015-11-06 21:46:48.976246
#   5 | Escobar   | Marilynn   | f      |     64 |    143 | 1944-10-09 | Brown     | Red        | 2015-11-06 21:46:48.979058 | 2015-11-06 21:46:48.979058
#   6 | Velez     | Lynette    | f      |     71 |    144 | 1946-09-11 | Hazel     | Brown      | 2015-11-06 21:46:48.981885 | 2015-11-06 21:46:48.981885
#   7 | Rodriguez | Vaughn     | m      |     67 |    123 | 1956-10-10 | Brown     | Black      | 2015-11-06 21:46:48.984742 | 2015-11-06 21:46:48.984742
#   8 | Myers     | Teresita   | f      |     70 |    169 | 1942-04-09 | Blue      | Blond      | 2015-11-06 21:46:48.987413 | 2015-11-06 21:46:48.987413
#   9 | Whaley    | Chris      | o      |     72 |    177 | 1994-07-08 | Brown     | Black      | 2015-11-06 21:46:48.989956 | 2015-11-06 21:46:48.989956
#  10 | Rich      | Dylan      | m      |     70 |    149 | 1941-01-28 | Hazel     | Brown      | 2015-11-06 21:46:48.992737 | 2015-11-06 21:46:48.992737
#  11 | Serrano   | Rickey     | m      |     60 |    110 | 1957-01-19 | Brown     | Brown      | 2015-11-06 21:46:48.995247 | 2015-11-06 21:46:48.995247
#  12 | Randolph  | Madonna    | f      |     67 |    145 | 1984-04-20 | Blue      | Brown      | 2015-11-06 21:46:48.997828 | 2015-11-06 21:46:48.997828
#  13 | Beard     | Sue        | f      |     62 |    111 | 1982-02-14 | Hazel     | Black      | 2015-11-06 21:46:49.000416 | 2015-11-06 21:46:49.000416
#  14 | Hilton    | Andreas    | m      |     71 |    153 | 1999-05-01 | Brown     | Blond      | 2015-11-06 21:46:49.003033 | 2015-11-06 21:46:49.003033
#  15 | Finch     | Morton     | m      |     64 |    123 | 1981-11-04 | Blue      | Blond      | 2015-11-06 21:46:49.005542 | 2015-11-06 21:46:49.005542
#  16 | Flowers   | Rosetta    | f      |     58 |    115 | 1991-03-01 | Brown     | Black      | 2015-11-06 21:46:49.020211 | 2015-11-06 21:46:49.020211
# (16 rows)


# require 'csv'
# namespace :db do
#   namespace :populate do
#     desc 'Fill the licensees table with data'
#     task licensee: :environment do
#       Licensee.transaction do
#         CSV.foreach(Rails.root + 'data/licensee.csv', headers: true) do |licensee_row|
#           licensee = licensee_row.to_hash
#           next if Licensee.exists? licensee
#           Licensee.create! licensee
#         end
#       end
#     end
#   end
# end




# question 4:

Licensee.where eye_color: 'Hazel', hair_color: ['Brown', 'Black']
# Licensee.where "eye_color = :desired_eye_color and hair_color in :desired_hair_colors",
#                {eye_color: 'Hazel', hair_colors: ['Brown', 'Black']}




# question 5:

marilynn_escobar = Licensee.find_by surname: 'Escobar', given_name: 'Marilynn'
marilynn_escobar.height -= 1
marilynn_escobar.save

chris_whaley = Licensee.find_by surname: 'Whaley', given_name: 'Chris'
chris_whaley.height -= 1
chris_whaley.save

 # 5 | Escobar   | Marilynn   | f      |     63 |    143 | 1944-10-09 | Brown     | Red        | 2015-11-06 21:46:48.979058 | 2015-11-06 22:08:06.212809
 #  9 | Whaley    | Chris      | o      |     71 |    177 | 1994-07-08 | Brown     | Black      | 2015-11-06 21:46:48.989956 | 2015-11-06 22:08:06.267005



# question 6:

dylan_rich = Licensee.find_by surname: 'Rich', given_name: 'Dylan'
dylan_rich.destroy

teresita_myers = Licensee.find_by surname: 'Myers', given_name: 'Teresita'
teresita_myers.destroy
