require 'csv'
# Diagnostic answers to:

# question 2:
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
    Licensee.create(
      surname: row[0],
      given_name: row[1],
      gender: row[2],
      height: row[3],
      weight: row[4],
      born_on: row[5],
      eye_color: row[6],
      hair_color: row[7]
    )
  end
end

# question 4:
sql = "SELECT id FROM Licensee WHERE eye_color = 'Hazel' AND hair_color IN
('brown', 'black')"
Licensee.where(id: sql)

# question 5:
sql = "SELECT
        id
       FROM Licensee
       WHERE (surname = 'Rich' AND given_name = 'Dylan')
        OR (surname = 'Myers' AND given_name = 'Teresita')"
Licensee.delete(sql)
