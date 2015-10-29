require 'csv'
# Assessment answers to:
rails g model Licensee #added properties in migrate file before running rails db:migrate

# question 2:
licensee = Licensee.new surname: 'Bishop',given_name: 'Caren',gender: 'f',height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black'
# question 3:
require 'csv'

namespace :db do
  namespace :populate do
    desc "Fill the cities table with example data"
    task licensees: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv',
                    headers: true) do |licensee_row|
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! licensee

        end
      end
    end
  end
end


# question 4:
SELECT * FROM licensees where eye_color = 'Hazel'
  AND hair_color = 'Brown' OR hair_color = 'Black'
;
# question 5:
licensee = Licensee.where("surname IN('Escobar', 'Whaley')" and Licensee.where("given_name IN('Marilynn', 'Chris')"
licensee.height -= 1

# question 6:
