 # Question 4. Change the motto of one of your houses. Look it up by its name.
  # + Save your code in `scripts/update.rb`.

house = House.where('motto = :motto', motto: 'Winter is coming.')
house.update!(motto: 'Winter is coming in Boston.')

p house
