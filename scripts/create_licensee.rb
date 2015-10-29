# Question 2. Use ActiveRecord to add Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black into the table of licensees.

licensee = Licensee.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black')
p licensee
