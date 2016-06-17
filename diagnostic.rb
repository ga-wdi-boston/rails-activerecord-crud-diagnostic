require 'csv'
# Diagnostic answers to:

# question 2:
Licensee.create(surname: 'Bishop', given_name: 'Caren', gender: 'f',
                height: 63, weight: 132, born_on: '1943-09-26',
                eye_color: 'Brown', hair_color: 'Black')
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
    Licensee.create(row.to_hash)
  end
end

# question 4:
Licensee.find(:conditions => "eye_color = 'Hazel' AND hair_color = 'Brown'")
# question 5:
Licensee.destroy(:conditions => "given_name = 'Dylan' AND surname = 'Rich'")
Licensee.destroy(:conditions => "given_name = 'Teresita' AND surname = 'Myers'")
