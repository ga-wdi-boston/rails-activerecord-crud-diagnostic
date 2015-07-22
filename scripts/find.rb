result = Person.where("age = :age OR title = :title",  age: "20", title: "Princess of Winterfell" )
p result
