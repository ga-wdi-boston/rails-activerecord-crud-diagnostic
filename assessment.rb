require 'csv'
# Assessment answers to:
rails g model Licensee surname:string given_name:string gender:string height:integer weight:integer dob:date,eye_color:string hair_color:string

# question 2:
caren = Licensee.create surname: 'Bishop', given_name: 'Caren', gender: 'f', height:63, wieght:132, dob:1943-09-26, eye_color:'Brown', hair_color:'Black'

# question 3:
rails g model CreateLicensees
require 'data/licensees.csv'
class CreateCreateLicensees < ActiveRecord::Migration
  def change
    create_table :create_licensees do |t|

      t.timestamps null: false
    end
  end
end

#then do something but I don't know what and I can't find it.
# question 4:
Licensee.find_by! eye_color:'Brown' and hair_color:'Brown' or hair_color:'Black'
# question 5:
marylynn = Licensee.find_by! surname:'Escobar' and given_name:'Marilynn'
chris = Lincensee.find_by! surname:'Whaley' and given_name: 'Chris'
marilynn.height -= 1
chris.height -=1
# question 6:
dylan = Licensee.find_by! surname: 'Rich' and given_name:'Dylan'
teresita = Licensee.find_by! surname: 'Myers' and given_name:'Teresita'
dylan.destroy!
teresita.destroy!
