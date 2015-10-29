# Question 5. Use ActiveRecord to make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.



Licensee.transaction do
  licensees = Licensee.all
  licensees.each do |licensee|
    licensee.height -= 1 if licensee.find_by(surname:) == 'Escobar' licensee.find_by(given_name:) == 'Marilynn'
    licensee.height -= 1 if licensee.find_by(surname:) == 'Whaley' licensee.find_by(given_name:) == 'Chris'
    licensee.save!
  end
end
