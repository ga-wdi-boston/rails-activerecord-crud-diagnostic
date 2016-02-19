require 'csv'
# Diagnostic answers to:

# question 2:

caren = Licensee.create surname: 'Bishop',
                        given_name: 'Caren',
                        gender: 'f',
                        height: 63,
                        weight: 132,
                        born_on: '1943-09-26',
                        eye_color: 'Brown',
                        hair_color: 'Black';


# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
    licensee = row.to_hash
    Licensee.create! licensee unless Licensee.exists? licensee
  end
end

# question 4:

licensees = Licensee.where(eye_color: 'Hazel').where(hair_color: 'Brown').or(hair_color: 'Black')

licensees.each {|licensee| puts "#{licensee.surname}, #{licensee.given_name}"}


# question 5:

# question 6:
