require 'csv'
# Assessment answers to:

# question 2:
person = Licensee.new
person.surname = 'Bishop'
person.given_name = 'Caren'
person.height = 62
person.weight = 132
person.dob = '1943-09-26'
person.gender = 'm'
person.eye_color = 'Brown'
person.hair_color = 'Black'
person.save ? puts('success') : puts('fail')


# question 3:
  Licensee.transaction do
    CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |license_row |
          license = license_row.to_hash
          next if Licensee.exists? license
          Licensee.create! license
        end
      end

# question 4:
p Licensee.where('eye_color = :eye_color and hair_color in (:hair_colors) ', eye_color: 'Hazel', hair_colors: %w( Brown Black))


# question 5:
me = Licensee.find_by! given_name: 'Marilynn',  surname: 'Escobar'
me.height -= 1
me.save!

cw = Licensee.find_by! given_name: 'Chris',  surname: 'Whaley'
cw.height -= 1
cw.save!

# question 6:
dr = Licensee.find_by! given_name: 'Dylan',  surname: 'Rich'
dr.destroy!

tm = Licensee.find_by! given_name: 'Teresita',  surname: 'Myers'
tm.destroy!


