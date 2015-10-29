require 'csv'
# Assessment answers to:
Generate a model (`Licensee`) and migration (`db/migrate/<time stamp>_create_licensees.rb`) to hold the data in `data/licensees.csv`.  Run `rake db:migrate` to create the table.

class Licensee < ActiveRecord::Migration
  def create_table "licensees"
    surname: CHARACTER VARYING
    given name: CHARACTER VARYING
  end
# question 2:
licensee = Licensee.create
# question 3:

# question 4:

# question 5:

# question 6:
