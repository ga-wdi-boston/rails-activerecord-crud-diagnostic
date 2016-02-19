require 'csv'

namespace :db do
  namespace :populate do
    desc 'Populate database with example data'
    task all: [:licensees]

    desc 'Populate database with licence information'
    task licensees: :environment do
      License.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv',
                    headers: true) do |row|
                      license = row.to_hash
                      License.create! license unless License.exists? license
                    end
      end
    end

  end
end
