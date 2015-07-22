require 'csv'

CSV.foreach('../westeros/houses.csv', headers: true) { |house| House.create!(house.to_hash) }
CSV.foreach('../westeros/people.csv', headers: true) { |person| Person.create!(person.to_hash) }