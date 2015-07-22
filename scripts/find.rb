people = Person.where('age > :year or title = :title', year: 40, title: 'Queen of Meereen and Mother of Dragons')

p people
