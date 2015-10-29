require 'csv'
# Assessment answers to:

# question 1: the instructions didn't specify that we actually needed to *populate* the data of the data/licensees.csv file, so I didn't



# Question 2. Use ActiveRecord to add Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black into the table of licensees.
# in the  scripts/create_licensee.rb file
licensee = Licensee.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black')
p licensee

# Question 3. Use CSV.foreach and ActiveRecord to load the data from data/licensees.csv into the licensees table.

# we're making a rake task and wrapping it around some ruby code
# so we can use rake to do something
namespace :db do
  namespace :populate do

# begin licensees table section
    desc 'Fill the licensees table with the example data'
    task licensees: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |licensee_row|
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! licensee
        end
      end
    end
# end licensee table section
  end
end


# Question 4. Use ActiveRecord to retrieve all the licensees with Hazel eye color and Brown or Black hair color.

# still shaky on syntax
eye_hair = Licensee.find_by! eye_color: 'Hazel', hair_color: 'Brown' or hair_color 'Black'

# Question 5. Use ActiveRecord to make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

# still shaky on syntax
Licensee.transaction do
  licensees = Licensee.all
  licensees.each do |licensee|
    licensee.height -= 1 if licensee.find_by(surname:) == 'Escobar' licensee.find_by(given_name:) == 'Marilynn'
    licensee.height -= 1 if licensee.find_by(surname:) == 'Whaley' licensee.find_by(given_name:) == 'Chris'
    licensee.save!
  end
end

# Question 6. Use ActiveRecord to remove Dylan Rich and Teresita Myers from the table of licensees.

dylan_rich = Licensee.find_by! surname: 'Rich', given_name: 'Dylan'

dylan_rich.destroy!

teresita_myers = Licensee.find_by! surname: 'Myers', given_name: 'Teresita'

teresita_myers.destroy!
