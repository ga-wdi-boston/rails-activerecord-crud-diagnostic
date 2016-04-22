require 'csv'
# Diagnostic answers to:

# question 2:
Licensee.new(surname='Bishop' given_name='Caren' gender='f' height='63' weight='132' born_on='1943-09-26' eye_color='Brown' hair_color='Black').save!
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end
# question 4:
Licensee.find(where eye_color='Hazel' AND hair_color='Black')
# question 5:
licensees.find(where surname='Rich' AND given_name='Dylan').destroy
