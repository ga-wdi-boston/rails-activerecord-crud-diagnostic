require 'csv'
# Assessment answers to:

#question 1:
$ rails g model Licensee surname:string given_name:string gender:string height:integer weight:integer dob:date eye_color:string hair_color:string
    invoke active_record
    create db/migrate/<time stamp>_create_licensees.rb
    create app/models/licensee.rb

# question 2:
licensee = Licensee.create surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26' eye_color: 'Brown', hair_color: 'Black'

# question 3:
require 'csv'

namespace :db do
  namespace :populate do

    desc 'Fill licensees table w data'
    task licensees: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |licensee_row|
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! licensee
        end
      end
    end
  end
end

# question 4:

Licensee.where('hair_color IN :hair_colors', hair_colors: %w(Brown Black)).where('eye_color IN :eye_colors', eye_colors: %w(Hazel))

# question 5:

escobar = Licensee.find_by! surname: 'Escobar'

escobar.update! height -= 1

escobar.save!


whaley = Licensee.find_by! surname: 'Whaley'

whaley.update! height -= 1

whaley.save!

# question 6:

rich = Licensee.find_by! surname: 'Rich'

rich.destroy!

teresita = Licensee.find_by! given_name: 'Teresita'

teresita.destroy!
