require 'csv'
# Diagnostic answers to:

# question 2:
Licensee.create!({surname: "Bishop", given_name: "Caren", gender: "f", height: 63, weight: 132, born_on: "1943-09-26", eye_color: "Brown", hair_color: "Black"})
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:
Licensee.where((eye_color: "Hazel") AND (hair_color: "Brown") OR (eye_color: "Hazel") AND (hair_color: "Black")
# question 5:
Licensee.where((given_name: "Dylan") AND (surname: "Rich") OR (given_name: "Teresita") AND (surname: "Myers")).destroy_all
