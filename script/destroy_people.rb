Licensee.transaction do
  licensees = Licensee.all
  licensees.each do |licensee|
    if (licensee.surname = 'Rich' && licensee.given_name = 'Dylan')
      licensee.destroy!
    elsif (licensee.surname = 'Myers' && licensee.given_name = 'Teresita')
      licensee.destroy!
    end
  end
end

