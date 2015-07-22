lannister = House.where('name = :name', name: 'House Lannister')
lannister[0].update(motto: 'We suck')
