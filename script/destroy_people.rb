dylan = Licensee.where("surname = 'Rich' AND given_name = 'Dylan'")
dylan.destroy!
teresita = Licensee.where("surname = 'Myers' AND given_name = 'Teresita'")
teresita.destroy!
