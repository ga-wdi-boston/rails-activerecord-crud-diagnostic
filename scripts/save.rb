copy House(name, motto, sigil) FROM './westeros/houses.csv' WITH ( FORMAT csv, HEADER true)
copy People(name, title, quote, image, age) FROM './westeros/people.csv' WITH ( FORMAT csv, HEADER true)

