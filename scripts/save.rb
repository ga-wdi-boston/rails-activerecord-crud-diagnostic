require 'csv'

CSV.foreach('../westeros/houses.csv', headers: true) do |house|
  House.create!(house.to_hash)
end

CSV.foreach('../westeros/people.csv', headers: true) do |person|
  House.create!(person.to_hash)
end
