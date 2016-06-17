require 'csv'
# Diagnostic answers to:

# question 2:
Licensee.create(Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black)
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:

Person.index()

# question 5:
