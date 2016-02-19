require 'csv'
# Diagnostic answers to:
# rails g model Licensee surname:string given_name:string gender:string height:integer weight:integer born_on:date eye_color:string hair_color:string
# question 2:

Licensee.new('Bishop','Caren','f',63,132,'1943-09-26','Brown','Black')

# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:
Licensee.where hair_color: %w(Hazel), eye_color: %(Black Brown)

# question 5:
Licensee.where surname: %w(Escobar Whaley) given_name: %w(Marilynn Chris)
rails g migration ChangeHeightToOneInchShorter height:height-1

# question 6:
RichAndTeresita = Licensee.where surname: %w(Rich Myers) given_name: %w(Dylan Teresita)
RichAndTeresita.destroy
