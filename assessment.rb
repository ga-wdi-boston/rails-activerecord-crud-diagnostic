require 'csv'
# Assessment answers to:

# question 2:
person = Licensee.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black')

# question 3:
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv',
                    headers: true) do |licensee_row|
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! licensee
        end
      end
# question 4:
licensees = Licensee.where("eye_color = :eye_color and hair_color = :hair_color or hair_color = :second_color", { eye_color: "Hazel", hair_color: "Brown", second_color: "Black" })

p licensees

# question 5:
mary = Licensee.find_by("surname = :surname and given_name = :given_name", { surname: "Escobar", given_name: "Marilynn"})
mary.height -= 1

p mary.height

chris = Licensee.find_by("surname = :surname and given_name = :given_name", { surname: "Whaley", given_name: "Chris"})
chris.height -= 1

p chris.height
# question 6:

dylan = Licensee.find_by("surname = :surname and given_name = :given_name", { surname: "Rich", given_name: "Dylan"})
dylan.destroy!

teresita = Licensee.find_by("surname = :surname and given_name = :given_name", { surname: "Myers", given_name: "Teresita"})
teresita.destroy
