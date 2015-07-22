#people
require 'csv'

CSV.foreach('../westeros/people.csv', headers: true) do |person|
  Person.create!(person.to_hash)
end

#houses
require 'csv'

CSV.foreach('../westeros/houses.csv', headers: true) do |house|
  House.create!(house.to_hash)
end
