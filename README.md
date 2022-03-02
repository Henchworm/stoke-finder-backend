# Stoke Finder FE

![languages](https://img.shields.io/github/languages/top/stoke-finder-2110/stoke-finder-backend?color=red)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov)
[![All Contributors](https://img.shields.io/badge/contributors-5-orange.svg?style=flat)](#contributors-)


## Description 

Stoke Finder FE is the frontend application of the Stoke Finder project. Stoke Finder is an application designed to aid users in the creation, and discovery of new outdoor adventures based on outdoor activities the user adds to their profile preferences. The purpose is to handle the consumption of API's necessary for populating views in the rails application, authenticate user login/creation through the application of OAUTH, demonstrate convetional means of packaging, sending, and receiving JSON responses to and from the BE server, and creating a user friendly interface with styling successfully implemented.

## Versions
- Ruby 2.7.2
- Rails 5.2.6

## Gems
```ruby 
  #Global Scope Gems 
  gem 'bcrypt', '~> 3.1.7'
  gem 'faraday'
  gem 'bootstrap', '~> 5.1.3'
  gem 'figaro'
  gem 'omniauth-google-oauth2'
  
  #group :development, :test
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'pry'
  gem 'launchy'
  gem 'capybara'
  gem 'orderly'
  gem 'shoulda-matchers'
  gem 'rspec_junit_formatter'
  gem 'factory_bot_rails'
  
  #group :test
  gem 'webmock'
  gem 'simplecov'
  gem 'faker'
  gem 'vcr'
```

## Local Setup 

1. Fork & Clone the repo 
```shell
$ git clone git@github.com:stoke-finder-2110/stoke-finder-frontend.git
```
2. Navigate to the directory 
```shell 
$ cd stoke-finder-frontend 
```
3. Install gem packages:
```shell
$ bundle install
```
4. Update gem packages: 
```shell
$ bundle update
```
5. SRun the migrations: 
```shell
$ rake db:{drop,create,migrate,seed}
```
## Schema 
![Screen Shot 2022-03-02 at 11 25 33 AM](https://user-images.githubusercontent.com/81737385/156424646-1a02280b-501d-4583-a211-555ecc7506dc.png)
![Screen Shot 2022-03-02 at 11 26 35 AM](https://user-images.githubusercontent.com/81737385/156424805-0ae05cf8-5fc9-4d31-8da7-027a2aa31933.png)

## Learning Goals 
- Create two independent applications hosted on Heroku that successfully communicate with each other
- Follow SOA convention
- Use serializers to package, and send JSON responses
- Implement OMNIAUTH authentication
- Implement sessions after user sign in
- Test API exposure
- Consume necessary APIs
- Fetch Necessary data from APIs exposed on the BE. 

## Author

<a href="https://github.com/stoke-finder-2110/stoke-finder-frontend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=stoke-finder-2110/stoke-finder-frontend" />
</a>


