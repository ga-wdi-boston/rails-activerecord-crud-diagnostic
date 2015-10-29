# Question 6. Use ActiveRecord to remove Dylan Rich and Teresita Myers from the table of licensees.

dylan_rich = Licensee.find_by! surname: 'Rich', given_name: 'Dylan'

dylan_rich.destroy!

teresita_myers = Licensee.find_by! surname: 'Myers', given_name: 'Teresita'

teresita_myers.destroy!
