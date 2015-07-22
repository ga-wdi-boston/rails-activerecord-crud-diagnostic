require 'csv'

CSV.foreach('../westeros/houses.csv', headers: true) do |house|
  House.create!(house.to_hash)
end
