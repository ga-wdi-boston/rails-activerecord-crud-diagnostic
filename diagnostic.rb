require 'csv'
# Diagnostic answers to:

# question 2:
Licensee.CreateLicensees('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown',
                         'Black')

Licensee.create(
  surname: 'Bishop',
  given_name: 'Caren',
  gender: 'f',
  height: 63,
  weight: 132,
  born_on: '1943-09-26',
  eye_color: 'Brown',
  hair_color: 'Black'
)

# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
    Licensee.CreateLicensees(row)
  end
end

# question 4:
Licensee.where(eye_color: 'Hazel').where(hair_color: 'brown').or(hair_color:
'black')

# question 5:
licensee = Licensee.where(surname: 'Rich', given_name: 'Dylan').or(surname:
'Myers', given_name: 'Teresita')
licensee.destroy
