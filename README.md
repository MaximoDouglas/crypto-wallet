## Ruby on Rails - learning
Repository of study projects using Ruby on Rails.

## Projects
### crypto-wallet
It is a full-stack project, which implements basic CRUD features on Cripto Coins, as well as its Mining Types. The goal of this project is to agregate basic conceptos on Ruby on Rails development, creating an app to register the user cripto coins wallet. 

### notebook-api
It is an API-only project which implements a CRUD-like contacts notebook application. The goal of this project is to use intermediate and advanced concepts on RESTful apis with Ruby on Rails, as well as Capybara and Rspec test.

#### Run project
- Enter fold crypto_wallet
- Run ```bundler```
- If it is the first time you're starting the project or if you want to reset the database with the initial data, run the command ```rails dev:setup```. It will run a rake task to delete the already existing data base, re-create it and seed it with some coins and some mining types. 
- To start the server, run ```rails s```

## Deploy to Heroku
The main source to make this is to follow the instructions on [Getting Started on Heroku with Rails 5.x](https://devcenter.heroku.com/articles/getting-started-with-rails5), but even if you follow the tuto, some problems or errors might appear. The steps listed bellow are made trying to avoid this problems:

- On gemfile, put the ```gem 'sqlite3'``` on __development and test__ group only. Put ```gem 'pg'``` for the production group
- On gemfile, put ```gem 'webpacker'``` before the environment groups
- Run ```bundle install````
- Run ```rails webpacker:install```
- On file ./config/environments/production.rb, replace ```config.assets.js_compressor = :uglifier``` by ```config.assets.js_compressor = Uglifier.new(harmony: true, compress: {unused: false})```
- To test if everything went well before pushing it to heroku, you can:
    - Run ```RAILS_ENV=production rails assets:precompile```
