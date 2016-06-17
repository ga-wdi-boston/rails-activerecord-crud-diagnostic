require 'csv'
# Diagnostic answers to:

# question 2:
Licensee.create([
  { title: 'Hello', artist: 'Hello', year: 1998 },
  Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black
])

# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:

# question 5:
