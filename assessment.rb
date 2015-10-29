require 'csv'
# Assessment answers to:
rails g model Licensee surname:string given_name:string gender:string height:integer weight:integer dob:date eye_color:string hair_color:string

from cmd line run rake db:migrate

# question 2:
licensee = Licensee.create surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black'

p licensee

# question 3:
# create db.rake file under tasks subfolder which also needs to be created

namespace :db do
  namespace :populate do

    desc 'fill the licensees table with example data'
    task licensees: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do | licensee_row |
          licensee= licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! licensee
        end
      end
    end

# question 4:
Licensee.where "eye_color like :eye_color", {eye_color: 'Hazel’}
  & "hair_color like :hair_color", {hair_color: 'Brown'}
    ||  "hair_color like :hair_color", {hair_color: 'Black'}

# question 5:
$ rails g migration RemoveOneInchFromLicensee height:integer
  which will create a script file to be run from command line.
  script file which will be created & updated is below.

licensee = Licensee.find_by! surname: 'Escobar' and given_name: 'Marilyn'
  or surname: 'Whaley'given_name: 'Chris'

licensee.weight -= 1

licensee.save!

# question 6:
