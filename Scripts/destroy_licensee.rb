

d = Licensee.find_by! surname: 'Rich', given_name: 'Dylan'

  d.destroy!


t = Licensee.find_by! surname: 'Myers', given_name: 'Teresita'

  t.destroy!
