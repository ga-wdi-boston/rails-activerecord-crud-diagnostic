Person.where('age > :age or title = :title', { age: 35, title: 'Queen of Meereen and Mother of Dragons' })
