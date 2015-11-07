#Marilynn Escobar

m = Licensee.find_by! surname: 'Escobar', given_name: 'Marilynn'
  m.height -= 1
    m.save!


#Chris Whaley

c = Licensee.find_by! surname: 'Whaley', given_name: 'Chris'
  c.height -= 1
    c.save!
