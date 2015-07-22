# Kill off, er, I mean delete one of the people. Look them up by their title.
Person.where('title = :title', title: 'Hand of the King and Master of Coin').destroy
