# Rails Server for Diagnosing Tool Demo

## Getting started

Install gems
```
$ bundle install
```
Setup DB -- this should include seeding test data from `db/seeds.rb`
```
$ rake db:create
$ rake db:setup
```
Run the server on port 3000
```
$ rails s
```
Access the rails consols
```
$ rails c
```

## Testing
There are example tests in `tests/controllers/diagnosis_frequencies_controller_test.rb`. Testing still
needs to be expanded across the application.
```
$ rails test
```
