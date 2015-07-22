dany = Person.where('title = :title', title: 'Queen of Meereen and Mother of Dragons')

dany[0].destroy
