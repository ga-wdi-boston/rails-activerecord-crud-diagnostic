require 'csv'


Licensee.transaction do
  CSV.foreach(Rails.root + 'data/licensees.csv',
  headers: true) do |licensee_row|
    licensee = licensee_row.to_hash
          next if Licensee.exists? licensee
          Licensee.create licensee
  end
end


