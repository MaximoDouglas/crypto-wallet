namespace :prod do
  desc "Reset and seed the production database"
  task setup: :environment do
    if Rails.env.production?
      show_spinner("Reset database...")          { %x(heroku pg:reset --confirm argmax-cryptowallet) }
      show_spinner("Migrate database...")        { %x(heroku run rails db:migrate) }
      %x(heroku run rails prod:add_mining_types)
      %x(heroku run rails prod:add_coins)
    else
      puts "You need to be on production environment to perform this task"
    end
  end

  desc "Create coins"
  task add_coins: :environment do
    show_spinner("Creating coins...") do
      all_mining_types = MiningType.all
      coins = [{  
                  description: "Bitcoin", 
                  acronym: "BTC",
                  url_image: "https://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png",
                  mining_type: all_mining_types.sample
                  },
                  {
                  description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/628px-Ethereum_logo_2014.svg.png",
                  mining_type: all_mining_types.sample
                  }, 
                  {   
                  description: "Dash",
                  acronym: "DASH",
                  url_image: "https://pngimage.net/wp-content/uploads/2018/05/dash-coin-logo-png-6.png",
                  mining_type: all_mining_types.sample
                  }, 
                  {   
                  description: "Iota",
                  acronym: "IOT",
                  url_image: "https://criptohub.com.br/assets/svg/svg008.svg",
                  mining_type: all_mining_types.sample
                  }, 
                  {   
                  description: "ZCash",
                  acronym: "ZEC",
                  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png",
                  mining_type: all_mining_types.sample
              }]

      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end
  
  desc "Create mining types"
  task add_mining_types: :environment do
    show_spinner("Creating mining types...") do
      mining_types = [{  
                      description: "Proof of Work", 
                      acronym: "PoW"
                    }, {
                      description: "Proof of Stake",
                      acronym: "PoS"
                    }, {
                      description: "Proof of Capacity",
                      acronym: "PoC"
                    }]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end
  
  private 
    def show_spinner(init_message)
      spinner = TTY::Spinner.new("[:spinner] #{init_message}")
      spinner.auto_spin
      yield
      spinner.success('Done!')
    end

end
