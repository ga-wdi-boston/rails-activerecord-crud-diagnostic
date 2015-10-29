require 'csv'

namespace :db do
  namespace :populate do

    ###Licenses###
    desc 'Fill the licensees table with example data'
    task licensees: :environment do
      License.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv',
                    headers: true) do |license_row|
          license = license_row.to_hash
          next if License.exists? city #won't duplicate rows
          License.create! License
        end
      end
    end

  end
end
