require 'csv'
# Diagnostic answers to:

# question 2:
# rails-api generate migration \
# AddSurnameGivennameGenderHeightWeightBornonEyecolorHairColorToLicensees \
# surname:string given_name:string gender:string height:integer weight:integer \
# born_on:string eye_color:string hair_color:string

curl
curl --include --request POST http://localhost:3000/licensees \
   --header "Content-Type: application/json" \
   --data '{
       "licensee": {
            "surname": "Bishop",
            "given_name": "Caren",
            "gender": "f"
            "born_on": "1943-09-26"
            "height": 63
            "weight": 132
            "eye_color": "Brown"
            "hair_color": "Black"
       }
   }'
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:
# added to LicenseesController licensee_params
params.require(:licensee).permit(:surname, :given_name, :gender, :born_on, :height, :weight, :eye_color, :hair_color)
#
curl --include --request PATCH http://localhost:3000/licensees/ID \
   --header "Content-Type: application/json" \
   --data '{
       "licensee": {
            "surname": "",
            "given_name": ,
            "gender":
            "born_on":
            "height":
            "weight":
            "eye_color":
            "hair_color":
       }
   }'
# # question 5:
curl --include --request DELETE http://localhost:3000/licensees/ID
