require 'csv'

namespace :db do
  namespace :populate do
    desc 'Populate database with example data'
    task all: [:licensees]

    desc 'Populate database with licensees'
    task licensees: :environment do
      Licensee.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv',
                    headers: true) do |row|
                      licensee = row.to_hash
                      Licensee.create! licensee unless Licensee.exists? licensee
                    end
      end
    end
  end
end
