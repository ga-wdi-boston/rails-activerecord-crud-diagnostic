require 'csv'
# Assessment answers to:

# question 2:
person = Licensee.create surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black'
# question 3:
Licensee.transaction do
  CSV.foreach(Rails.root + 'data/licensees.csv', header: true) do |licensee_row|
    person = licensee_row.to_hash
    next if Licensee.exists? person
    Licensee.create! person
  end
end
# question 4:
Licensee.where(eye_color = 'Hazel').where(hair_color = 'Brown' OR hair_color = 'Black')
# question 5:
one = Licensee.find_by! surname: 'Escobar', given_name: 'Marilynn'
two = Licensee.find_by! surname: 'Whaley', given_name: 'Chris'
one.height -= 1
one.save!
two.height -= 1
two.save!
# question 6:
one = Licensee.find_by! surname: 'Rich', given_name: 'Dylan'
two = Licensee.find_by! surname: 'Myers', given_name: 'Teresita'
one.destroy!
two.destroy!
