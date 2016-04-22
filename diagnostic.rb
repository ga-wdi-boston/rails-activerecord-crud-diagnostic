require 'csv'
# Diagnostic answers to:
rails g model Licensee surname:string given_name:string gender:string height:integer weight:integer born_on:date eye_color:string hair_color:string

rake db:migrate
# question 2:
Licensee.create!(:surname =>"Bishop", :given_name => "Caren", :gender => "f", :height => 63, :weight => 132, :born_on =>1943-09-26, :eye_color => "Brown", :hair_color => "Black")

# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:

# question 5:
