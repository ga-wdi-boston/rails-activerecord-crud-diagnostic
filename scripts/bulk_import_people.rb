require 'csv'

CSV.foreach('../westeros/people.csv', headers: true) do |person|
  Person.create!(person.to_hash)
end
