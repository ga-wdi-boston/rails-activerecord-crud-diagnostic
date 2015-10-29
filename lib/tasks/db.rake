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
