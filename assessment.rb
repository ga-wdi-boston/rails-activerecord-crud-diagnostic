require 'csv'
# Assessment answers to:

#ran: rails g model Licensee
#thenran: rake db:migrate

# question 2:
Person.create(surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63,weight: 132, dob: '1943-09-26',eye_color: 'Brown', hair_color: 'Black')

# question 3:

Licensees.transaction do
          CSV.foreach(Rails.root + 'data/licensees.csv' headers: true) do | Licensee_row |

            Licensee = Licensee_row.to_hash
            next if Licensee.exists? Licensee

            Licensee.create!Licensee

          end #of next if  DO I need this? (I think maybe not)

          end #end of CSV.foreach

end #end of Licensees.transaction

# question 4:



# question 5:
#finds M Escobar, I know I should have another search Criteria in here
#but I don't know how to use more than 1 search criteria
m_escobar = Person.find_by! surname: 'Escobar'

#takes 5 lbs off, the next two steps manipulates the weight
# => helpful when manipulating price increases, inflation
m_escobar.height -= 1

#MUST SAVE
m_escobar.save!


#finds Chris Whaley, I know I should have another search Criteria in here
#but I don't know how to use more than 1 search criteria

# *** Also I am sure I could search for both ppl in the same line
# and perform the change only once!
c_whaley = Person.find_by! surname: 'Whaley'

#takes 5 lbs off, the next two steps manipulates the weight
# => helpful when manipulating price increases, inflation
c_whaley.height -= 1

#MUST SAVE
c_whaley.save!


# question 6:

t_meyers = Person.find_by! given_name: 'Teresita'

t_meyers.destroy!
#I used her given name because it was more unique!

d_rich = Person.find_by! surname: 'Rich'

d_rich.destroy!
