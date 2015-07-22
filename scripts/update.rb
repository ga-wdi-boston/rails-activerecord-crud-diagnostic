house = House.where('name = :name', name: 'House Baratheon')
house.update(motto: 'Ours is NOT the fury.')
