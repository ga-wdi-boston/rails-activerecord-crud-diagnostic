require 'csv'
# Diagnostic answers to:

# question 2:
Licensee.create surname: 'Bishop',
            given_name: 'Caren',
            gender: 'f',
            height: 63,
            weight: 132,
            born_on: '1943-09-26',
            eye_color: 'Brown',
            hair_color: 'Black'

# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
    person = row.to_hash
    Person.create! person unless Person.exists? person
  end
end

# question 4:
# Use ActiveRecord to retrieve all the licensees with Hazel eye color and
# Brown or Black hair color.
Licensee.where( { eye_color: "Hazel", hair_color: ["Brown", "Black"] } )

# question 5:
# Use ActiveRecord to make each of Marilynn Escobar and Chris Whaley
# one inch shorter. Look them up by their names.
marilynn = Licensee.where( { given_name: "Marilynn", surname: "Escobar" } )
marilynn.update(height -= 1)

chris = Licensee.where( { given_name: "Chris", surname: "Whaley" } )
chris.update(height -= 1)

# question 6:
# Use ActiveRecord to remove Dylan Rich and Teresita Myers from the table
# of licensees.
dylan = Licensee.where( { given_name: "Dylan", surname: "Rich"})
dylan.destroy

teresita = Licensee.where( { given_name: "Teresita", surname: "Myers"})
teresita.destroy
