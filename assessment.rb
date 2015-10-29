require 'csv'
# Assessment answers to:

# question 2:
licensee = Licensee.new surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26' , eye_color: 'Brown', hair_color: 'Black'
p licensee

# question 3:
Licensee.transaction do
  CSV.foreach(Rails.root + 'data/licensees.csv') do |row|
    licensee = row.to_hash
  end
end

# question 4:
Licensee.where('eye_color = (:eye_color) and hair_color = (:hair_color)', eye_color: 'Hazel', hair_color: %w(Brown Black))

# question 5:
marilynn = Licensee.find_by surname: 'Escobar', given_name: 'Marilynn'
marilynn.height = marilynn.height - 1
marilynn.save!

chris = Licensee.find_by surname: 'Whaley', given_name: 'Chris'
chris.height = chris.height - 1
chris.save!

# question 6:
dylan = Licensee.find_by surname: 'Rich', given_name: 'Dylan'
dylan.destroy!

teresita = Licensee.find_by surname: 'Myers', given_name: 'Teresita'
teresita.destroy!
