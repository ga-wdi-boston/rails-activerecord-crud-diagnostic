require 'csv'
# Diagnostic answers to:

# question 2:

# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

 rake import data/licensees.csv

# question 4:

# question 5:
Licensee.destroy(10, 8)
