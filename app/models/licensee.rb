class Licensee < ActiveRecord::Base
user = User.create(surname: "Bishop", given_name:"Caren", gender: "f", height:63, weight: 132, born_on:"1943-09-26",  eye_color:"Brown", hair_color:"Black")t:)

end


require 'csv'

CSV.foreach(licensees.csv, :headers => true) do |row|
  Moulding.create!(row.to_hash)
end
