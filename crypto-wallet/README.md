
## Crypto Wallet
A digital wallet for your crypto coins.

### Online [here](https://argmax-cryptowallet.herokuapp.com/)

### Ruby version
```
ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-darwin19]
```

### Running project
- Enter fold crypto-wallet
- Run ```bundler```
- If it is the first time you're starting the project or if you want to reset the database with the initial data, run the command ```rails dev:setup```. It will run a rake task to delete the already existing data base, re-create it and seed it with some coins and some mining types. 
- To start the server, run ```rails s```

### Deploy to Heroku
The main source to make this is to follow the instructions on [Getting Started on Heroku with Rails 5.x](https://devcenter.heroku.com/articles/getting-started-with-rails5), but even if you follow the tuto, some problems or errors might appear. The steps listed bellow are made trying to avoid this problems:

- On gemfile, put the ```gem 'sqlite3'``` on __development and test__ group only. Put ```gem 'pg'``` for the production group
- On gemfile, put ```gem 'webpacker'``` before the environment groups
- Run ```bundle install````
- Run ```rails webpacker:install```
- On file ./config/environments/production.rb, replace ```config.assets.js_compressor = :uglifier``` by ```config.assets.js_compressor = Uglifier.new(harmony: true, compress: {unused: false})```
- To test if everything went well before pushing it to heroku, you can:
    - Run ```RAILS_ENV=production rails assets:precompile```
