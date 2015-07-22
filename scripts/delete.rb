person = Person.where('title = :title', title: 'Queen of Meereen and Mother of Dragons')
person.destroy
