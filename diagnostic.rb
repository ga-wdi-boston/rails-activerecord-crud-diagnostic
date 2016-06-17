require 'csv'
# Diagnostic answers to:

# question 2:

curl --include --request POST http://localhost:3000/licencees \
--header "Content-Type: application/json" \
--data '{
"licencee": {
"surname": "Bishop",
"given_name": "Caren",
"gender": "f",
"height": 63,
"weight": 132,
"born_on": "1943-09-26",
"eye_color": "Brown",
"hair_color": "Black"
}
}'
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# ?? got stuck on this, tried bundle exec rake db: seed but it yelled at me and
# I ran out of time. Slow start this morning

# question 4:

# question 5:
