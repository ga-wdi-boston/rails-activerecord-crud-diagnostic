require 'csv'
# Diagnostic answers to:

# question 2:
Licensee.CreateLicensees('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown',
                         'Black')

# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
    Licensee.CreateLicensees(row)
  end
end

# question 4:
licensees = Licensee.where(eye_color: 'Hazel', hair_color: 'brown' ||
hair_color: 'black')

# question 5:
licensee = Licensee.where(surname: 'Rich', given_name: 'Dylan' ||
                          surname: 'Myers', given_name: 'Teresita')
licensee.destroy
