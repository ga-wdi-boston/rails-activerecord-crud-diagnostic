# Use ActiveRecord to retrieve all of the people greater than a certain age or having a specific title.
Person.where('title = :title', title: 'Lord Commander of the Night''s Watch')
