require 'csv'
# Assessment answers to:
rails g model Licensee surname given_name gender height:integer dob:date hair_color eye_color
# question 2:
Licensee.create
surname: 'Bushop',
given_name: 'Carrie'
gender: 'f',
height: 63,
dob: '1943-09-26'
hair_color: 'Brown'
eye_color: 'Black'

Licensee.all
# question 3:


CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |row|
  Licensee.create(row)
  licensee = row.to_hash
  unless Licensee.exsists? licensee
    Licensee.create! Licensee
  end
end

# question 4:

Licensee.where eye_color: 'Hazel', hair_color:['Black', 'Brown']
# question 5:
marilynn_escobar = Licensee.find_by surname: 'Escobar', given_name: 'Marilynn'
marilynn_escobar.height -=  1
marilynn_escobar.save

chris_whaley = Licensee.find_by surname: 'Whaley', given_name: 'Chris'
chris_whaley.height -= 1
chris_whaley.save
# question 6:
 dylan_rich = licensee.find_by surname: 'Rich', given_name: 'Dylan'
 dylan_rich.destroy


teresita_myers = licensee.find_by surname: 'Myers', given_name: 'Teresita'
teresita_myers.destroy
