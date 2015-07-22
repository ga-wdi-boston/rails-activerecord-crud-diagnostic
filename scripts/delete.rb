 # Question 5. Kill off, er, I mean delete one of the people. Look them up by their title.
  # + Save your code in `scripts/delete.rb`

person = Person.where('title = :title', title: 'Deceased')
Person.destroy(person)

p Person.all
