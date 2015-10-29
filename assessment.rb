require 'csv'
# Assessment answers to:

#question 1:
rails g model License

# question 2:

#create add parameters to the migrate file create from above
class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
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

#in a new script (create_license.rb) add the following person:
license = License.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black')
p license #displays that the above was created



# question 3:

#create a new file /tasks/db.rake

require 'csv'

namespace :db do
  namespace :populate do

    ###Licenses###
    desc 'Fill the licensees table with example data'
    task licensees: :environment do
      License.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv',
                    headers: true) do |license_row|
          license = license_row.to_hash
          next if License.exists? city #won't duplicate rows
          License.create! License
        end
      end
    end

  end
end

# question 4: Use ActiveRecord to retrieve all the licensees with Hazel eye color and Brown or Black hair color.

 License.find_by! eye_color: 'Hazel' && (hair_color == 'Brown' || hair_color == 'Black')

# question 5: Use ActiveRecord to make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

#create a file change_license.rb
License.transaction do
  licensees = License.all
  licensees.each do |license|
    if license.surname == 'Escobar' && license.given_name == 'Marilynn'
      license.height -= 1
    end
    if license.surname == 'Whaley' && license.given_name == 'Chris'
      license.height -= 1
    end
    license.save!
  end
end #I realize that this is probably a terrible way of doing this (assuming this is even correct)


# question 6: Use ActiveRecord to remove Dylan Rich and Teresita Myers from the table of licensees.

#create a file destroy_license.rb
License.transaction do
  licensees = License.all
  licensees.each do |license|
    if license.surname == 'Rich' && license.given_name == 'Dylan'
      license.destroy!
    end
    if license.surname == 'Myers' && license.given_name == 'Teresita'
      license.destroy!
    end
  end
end
