#  Question 3. Use ActiveRecord to retrieve all of the people greater than a certain age *or* having a specific title.
 # + Save your code in `scripts/find.rb`.

person = Person.where('age > :age', age: '35' || 'title = :title', title: 'Princess of Winterfell')
