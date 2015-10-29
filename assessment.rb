require 'csv'
# Assessment answers to:

# question 2:

people = Person.create surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: 1943-09-26, eye_color: 'Brown', hair_color: 'Black'
p people


# question 3:

namespace :db do
  namespace :populate do
desc 'Fill the people table with example data'
  task people: :environment do
    Person.transaction do
      CSV.foreach(Rails.root + 'data/licensees.csv',
       headers: true) do | person_row |
        person = person_row.to_hash
        Person.create(person)
      end
    end
  end
end
end


# question 4:

# question 5:

shorter = Person.find_by surname: 'Escobar', 'Whaley' given_name: 'Marilynn', 'Chris'

shorter.height -= 1

shorter.save!


# question 6:
