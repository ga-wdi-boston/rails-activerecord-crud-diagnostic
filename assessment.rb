require 'csv'
# Assessment answers to:

# question 2:
person = Licensee.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black')

# question 3:
rake db:populate:licensees 'data/licensees.csv'
# question 4:

# question 5:

# question 6:
