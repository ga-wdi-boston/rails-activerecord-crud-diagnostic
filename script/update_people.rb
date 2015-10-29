Licensee.transaction do
  licensees = Licensee.all
  licensees.each do |licensee|

    if (licensee.surname = 'Escobar' && licensee.given_name = 'Marilynn')
      licensee.height -= 1
    elsif (licensee.surname = 'Whaley' && licensee.given_name = 'Chris')
      licensee.height -= 1
    end
    licensee.save!
  end
end
