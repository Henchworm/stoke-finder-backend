# Stoke Finder BE

![languages](https://img.shields.io/github/languages/top/stoke-finder-2110/stoke-finder-backend?color=red)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov)
[![All Contributors](https://img.shields.io/badge/contributors-5-orange.svg?style=flat)](#contributors-)


## Description 

Stoke Finder BE is the backend application of the Stoke Finder project. Stoke Finder is an application designed to aid users in the creation, and discovery of new outdoor adventures based on outdoor activities the user adds to their profile preferences. The purpose is to handle the consumption and creation of API's necessary for populating views in the rails application, authenticate user login/creation through the application of OAUTH, demonstrate convetional means of packaging, sending, and receiving JSON responses to and from the BE server, and creating a user friendly interface with styling successfully implemented. Storage of the user creation, will be stored on the backend, and packaged for the FE through the API end point that is created on the BE application. 

## Versions
- Ruby 2.7.2
- Rails 5.2.6

## Gems
```ruby 
  #Global Scope Gems 
  gem 'bcrypt', '~> 3.1.7'
  gem 'faraday'
  gem 'bootstrap', '~> 5.1.3'
  gem 'jsonapi-serializer'
  gem 'geocoder'
  
  #group :development, :test
  gem 'pry'
  gem 'rubocop-rails'
  gem 'figaro'
  gem 'factory_bot_rails'
  gem 'rspec_junit_formatter'
  gem 'faker'
  
  #group :test
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'vcr'
  gem 'webmock'
```

## Local Setup 

1. Fork & Clone the repo 
```shell
$ git clone git@github.com:stoke-finder-2110/stoke-finder-backend.git
```
2. Navigate to the directory 
```shell 
$ cd stoke-finder-backend 
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
![Screen Shot 2022-03-02 at 1 14 29 PM](https://user-images.githubusercontent.com/81737385/156442238-b25ff194-fa60-496a-8e88-37c5e7d2c61e.png)
![Screen Shot 2022-03-02 at 1 14 44 PM](https://user-images.githubusercontent.com/81737385/156442272-ac0b86f8-6026-41ae-b468-f67716bd5bfe.png)

## Learning Goals 
- Create two independent applications hosted on Heroku that successfully communicate with each other
- Follow SOA convention
- Use serializers to package, and send JSON responses
- Implement OMNIAUTH authentication
- Implement sessions after user sign in
- Test API exposure
- Consume necessary APIs

## Author

<a href="https://github.com/stoke-finder-2110/stoke-finder-frontend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=stoke-finder-2110/stoke-finder-frontend" />
</a>


