# Animal shelter management app

An app developed as a CodeClan project. Please read [brief](./BRIEF.md) and [guidelines](./GUIDELINES.md) for more information.

# Setup

1. `cd app` cd into the app folder.
2. `createdb animal_shelter` to create the database.
3. `psql -d animal_shelter -f db/animal_shelter.sql` to create tables structure.
4. `ruby db/seed.rb` to populate sample data.
5. Access using browser on http://localhost:4567

# Tested with/pre-requisites

* Ruby 2.4
* Sinatra 2.0.7
* Minitest 5.11.3
* PSQL 11.4
