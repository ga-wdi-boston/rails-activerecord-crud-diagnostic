require 'csv'
# Diagnostic answers to:

# question 2:
rails g migration AddFields surname:string given_name:string gender:string height:integer weight:interger dob:date eye_color:string hair_color:string
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:

# question 5:
