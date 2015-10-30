
person = Licensee.new
person.surname = 'Bishop'
person.given_name = 'Caren'
person.height = 63
person.weight = 132
person.dob = '1943-09-26'
person.gender = 'f'
person.eye_color = 'Brown'
person.hair_color = 'Black'
person.save ? puts('success') : puts('fail')
