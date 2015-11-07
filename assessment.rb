require 'csv'
# Assessment answers to:

# question 2:
Licensee.create(surname: 'Bishop', given_name: 'Caren', height:63, weight: 132, dob: '1943-09-26', gender: 'f') ? puts('success') : puts('fail')

#or

Licensee.create!({surname: "Bishop", given_name:"Caren", gender:"f", height:63, weight:132, dob:"1943-09-26", eye_color:"Brown",hair_color:" Black"})


# question 3:
require 'csv'
 Licensee.transaction do
  CSV.foreach(Rails.root + 'data/licensees.csv',
              headers: true) do |licensee_row|
    licensee = licensee_row.to_hash
    next if Licensee.exists? licensee
    Licensee.create! licensee
  end
end


# question 4:
p Licensee.where('eye_color = :eye_color and hair_color in (:hair_colors) ', eye_color: 'Hazel', hair_colors: %w( Brown Black))

 SELECT "licensees".* FROM "licensees" WHERE (eye_color = 'Hazel' and hair_color in ('Brown','Black') )
#<ActiveRecord::Relation [#<Licensee id: 9, surname: "Velez", given_name: "Lynette", gender: "f", height: 71, weight: 144, dob: "1946-09-11", eye_color: "Hazel", hair_color: "Brown", created_at: "2015-11-07 21:50:21", updated_at: "2015-11-07 21:50:21">, #<Licensee id: 16, surname: "Beard", given_name: "Sue", gender: "f", height: 62, weight: 111, dob: "1982-02-14", eye_color: "Hazel", hair_color: "Black", created_at: "2015-11-07 21:50:21", updated_at: "2015-11-07 21:50:21">]>
=> #<ActiveRecord::Relation [#<Licensee id: 9, surname: "Velez", given_name: "Lynette", gender: "f", height: 71, weight: 144, dob: "1946-09-11", eye_color: "Hazel", hair_color: "Brown", created_at: "2015-11-07 21:50:21", updated_at: "2015-11-07 21:50:21">, #<Licensee id: 16, surname: "Beard", given_name: "Sue", gender: "f", height: 62, weight: 111, dob: "1982-02-14", eye_color: "Hazel", hair_color: "Black", created_at: "2015-11-07 21:50:21", updated_at: "2015-11-07 21:50:21">
# question 5:

m = Licensee.find_by! surname: 'Escobar', given_name: 'Marilynn'
  m.height -= 1



Marilynn Escobar

c = Licensee.find_by! surname: 'Whaley', given_name: 'Chris'
  c.height -= 1



# question 6:

d = Licensee.find_by! surname: 'Rich', given_name: 'Dylan'

  d.destroy!

t = Licensee.find_by! surname: 'Myers', given_name: 'Teresita'

  t.destroy!
