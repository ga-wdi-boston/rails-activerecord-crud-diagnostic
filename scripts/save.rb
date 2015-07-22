\copy houses(name, motto, sigil) FROM './westeros/houses.csv' WITH (FORMAT csv, HEADER true);

\copy people(name, title, quote, image, age) FROM './westeros/people.csv' WITH (FORMAT csv, HEADER true);
