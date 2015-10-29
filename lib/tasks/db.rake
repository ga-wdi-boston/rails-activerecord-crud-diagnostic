require 'csv'

namespace :db do
  namespace :populate do


    desc 'Fill the licensees table with example data'
    task licensee: :environment do
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
