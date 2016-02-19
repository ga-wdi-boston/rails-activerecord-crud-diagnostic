require 'csv'
# Diagnostic answers to:
  rails g model License surname:string given_name:string gender:string height:integer weight:integer born_on:date eye_color:string hair_color:string

# question 2:
  caren = License.create surname: 'Bishop',
                        given_name: 'Caren',
                        gender: 'f',
                        height: 63,
                        weight: 132,
                        born_on: 1943-09-26,
                        eye_color: 'Brown',
                        hair_color: 'Black'
p caren

# question 3:
task licensees: :environment do
  License.transaction do
    CSV.foreach 'data/licensees.csv',
      headers: true do |row|
        license = row.to_hash
        License.create! license unless License.exists?
      end
  end
end

# question 4:
lic = License.where 'eye_color = :eye_color AND hair_color = :h1 OR hair_color = :h2',
                    eys_color: 'Hazel', h1: 'Black', h2: 'Brown'
lic.each { |license| puts lic.surname, lic. given_name}

# question 5:
shorter = License.where 'surname = :s1 OR surname = :s2 AND given_name = :g1, OR given_name = :g2'
                        s1: 'Escobar', s2: 'Whaley', g1: 'Marilynn', g2: 'Chris'
shorter.each { |lic| lic.height -= 1}

# question 6:
