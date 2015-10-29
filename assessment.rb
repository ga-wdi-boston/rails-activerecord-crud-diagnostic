require 'csv'
# Assessment answers to:

# question 2:
Licensee.create surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black'

# question 3:
Licensee.transaction do
  CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |licensee_row|
    licensee = licensee_row.to_hash
    next if Licensee.exists? licensee
    Licensee.create! licensee
  end
end

# question 4:
Licensee.where eye_color: 'Hazel', hair_color: ['Black', 'Brown']

# question 5:
marilynn = Licensee.where surname: 'Escobar', given_name: 'Marilynn'
marilynn.height -= 1
marilynn.save!

chris = Licensee.where surname: 'Whaley', given_name: 'Chris'
chris.height -= 1
chris.save!

# question 6:
dylan = Licensee.where surname: 'Dylan', given_name: 'Rich'
dylan.destroy!

teresita = Licensee.where surname: 'Teresita', given_name: 'Myers'
teresita.destroy!
