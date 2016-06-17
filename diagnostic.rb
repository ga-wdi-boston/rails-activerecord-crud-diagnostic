require 'csv'
# Diagnostic answers to:

Was not able to get the databse up and working but did the requests anyways

# question 2:
curl --include --request POST "http://localhost:3000" \
--header "Content-Type application:json" \
--data "Licensee" '{
              "surname": "Bishop",
              "given_name": "Caren",
              "gender": "f",
              "height": 63,
              "weight": 132,
              "born_on": "1943-09-26",
              "eye_color": "Brown",
              "hair_color": "Black"


}'

# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:
curl --include --request GET "http://localhost:3000" \
--header "Content-Type application:json"
--data "Licensee" '{
              "eye_color": "Hazel"
              "hair_color": "Brown" or "Black"
}'
# question 5:
curl --include --request DELETE "http://localhost:3000/7"
curl --include --request DELETE "http://localhost:3000/9"
