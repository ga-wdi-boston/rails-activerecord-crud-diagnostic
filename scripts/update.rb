#Change the motto of one of your houses. Look it up by its name.
House.where('name = :name', name: 'House Lannister') do |house|
  house.update(motto: 'Never pay your debts!')
end
