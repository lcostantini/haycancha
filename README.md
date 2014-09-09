[![Code Climate](https://codeclimate.com/github/lcostantini/haycancha/badges/gpa.svg)](https://codeclimate.com/github/lcostantini/haycancha)
[![Test Coverage](https://codeclimate.com/github/lcostantini/haycancha/badges/coverage.svg)](https://codeclimate.com/github/lcostantini/haycancha)

# Description

The application has 3 namespaces.

## Owner
This is the namespace for the people who own a field and want to rent it.

- Sign in, sign out and register Owner users (with/without facebook)
- Owner has email, password, name, etc
- Owner has_many :fields
- Owner can edit data about his/her fields
- Owner can create and upadte schedules for his/her fields

## User
This is the namespace for people who wants to join a team and play on regular bases.

- Sign in, sign out and register to User (with/without facebook)
- Users can create teams.
- Users can invite and add other users to his/her team.
- Users can search and select one field and schedule to play.
- Users receive notification when the match is soon to be.

## Admin
This is the namespace for the application administrators and they can update any data in the application.
- Admin users can administrated all record in the app.

# Instalation
1. git clone https://github.com/lcostantini/haycancha.git
2. bundle install
3. rake db:migrate

# Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new pull request so we can talk about it.

# License
GPL
