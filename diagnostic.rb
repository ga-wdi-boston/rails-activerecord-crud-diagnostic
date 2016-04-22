require 'csv'
# Diagnostic answers to:

# question 2:
Licensee.create!({ surname: 'Bishop',
                   given_name: 'Caren',
                   gender: 'f',
                   height: 63,
                   weight: 132,
                   born_on: '1943-09-26',
                   eye_color: 'Brown',
                   hair_color: 'Black'
                  })
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
    Licensee.create!(row.to_hash)
  end
end

# question 4:
Licensee.where("eye_color = ? AND (hair_color = ? OR hair_color = ?)", 'Hazel', 'Black', 'Brown')
# question 5:
Licensee.where("(surname = ? OR surname = ?) AND (given_name = ? OR given_name = ?)", 'Rich', 'Myers', 'Dylan', 'Teresita').delete_all
