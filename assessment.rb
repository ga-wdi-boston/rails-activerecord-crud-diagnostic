require 'csv'
# Assessment answers to:
1) rails g model Licensee
2) modified db/migrate/<timestamps>_create_licensees.rb
3) rake db:create

# question 2:
1) create script/create_person.rb file

*********** code *********
person = Licensee.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black')
**************************

2) rails r script/create_person.rb
3) rails c -> Licensee.all to confirm the data entry
# question 3:
1) rails g task db populate
2) modified lib/tasks/db.rake file

  ********* code ***********
  require 'csv'

  namespace :db do
    namespace :populate do
      desc 'Fill the Licensee table with example data'
      task licensee: :environment do
        Licensee.transaction do
          CSV.foreach(Rails.root + 'data/licensees.csv',
                      headers: true) do |licensee_row|
            licensee = licensee_row.to_hash
            next if Licensee.exists? licensee
            # with !, if Person.create! person fail, throws error
            Licensee.create! licensee
          end
        end
      end # task people: end
    end
  end
  **************************
3) rake db:populate:licensee
4) rails c -> Licensee.all to confirm the data import

# question 4:
1) create and modify script/retrieve_licensees.rb

  ********** code **********
  people_1 = Licensee.where("eye_color = 'Hazel' AND (hair_color = 'Brown' OR hair_color = 'Black')")
  ***************************
2) rails r script/retrieve_licensees.rb

# question 5:
1) create and modify script/update_people.rb

************* code ***********
Licensee.transaction do
  licensees = Licensee.all
  licensees.each do |licensee|

    if (licensee.surname = 'Escobar' && licensee.given_name = 'Marilynn')
      licensee.height -= 1
    elsif (licensee.surname = 'Whaley' && licensee.given_name = 'Chris')
      licensee.height -= 1
    end
    licensee.save!
  end
end
******************************
2) rails r script/update_people.rb
# question 6:
1) create and modify script/destroy_people.rb

******** code *********
Licensee.transaction do
  licensees = Licensee.all
  licensees.each do |licensee|
    if (licensee.surname = 'Rich' && licensee.given_name = 'Dylan')
      licensee.destroy!
    elsif (licensee.surname = 'Myers' && licensee.given_name = 'Teresita')
      licensee.destroy!
    end
  end
end
***********************
2) rails r script/destroy_people.rb
