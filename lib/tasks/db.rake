require 'csv'
# we're making a rake task and wrapping it around some ruby code
# so we can use rake to do something
namespace :db do
  namespace :populate do

# begin licensees table section
    desc 'Fill the licensees table with the example data'
    task licensees: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |licensee_row|
          licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create! licensee
        end
      end
    end
# end licensee table section

  end
end
