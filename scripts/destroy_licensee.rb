licensee = Licensee.find_by! surname: 'Dylan', given_name: 'Rich'

licensee2 = Licensee.find_by! surname: 'Teresita', given_name: 'Myers'

licensee.destroy!
licensee2.destroy!
