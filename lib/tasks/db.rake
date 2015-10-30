namespace :db do
  desc "Fill the database with example data"
  task populate: :environment do
        task licensees: :environment do
      City.transaction do
        CSV.foreach(Rails.root + 'data/licensees.csv', headers: true) do |city_row |
          city = city_row.to_hash
          next if City.exists? city
          City.create! city
        end
      end
    end
  end

end


