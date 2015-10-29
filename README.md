![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Assessment:  An introduction to ActiveRecord

You have 35 minutes.

## Instructions

Fork and clone this repository, then

```bash
 $ cd rails-crud-assessment
 $ bundle install
 $ rake db:create
```

Follow the prompts below and complete each question.  You may use any resource, other than someone else in the classroom, to help you complete the solo assessment.  Add code you write to `assessment.rb`

- Question 1. Generate a model (`Licensee`) and migration (`db/migrate/<time stamp>_create_licensees.rb`) to hold the data in `data/licensees.csv`.  Run `rake db:migrate` to create the table.


- Question 2. Use ActiveRecord to add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.


- Question 3. Use CSV.foreach and ActiveRecord to load the data from `data/licensees.csv` into the `licensees` table.
??
- Question 4. Use ActiveRecord to retrieve all the licensees with Hazel eye color and Brown or Black hair color.
??
- Question 5. Use ActiveRecord to make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.
??
- Question 6. Use ActiveRecord to remove Dylan Rich and Teresita Myers from the table of licensees.
??
You can test your work, except the migration, with `rails runner assessment.rb`.  Use `p` in your script to output any results you'd like to check.

Commit and push your changes.

Submit a pull request.
