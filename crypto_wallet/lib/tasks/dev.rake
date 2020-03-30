namespace :dev do
  desc "Setup the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Drop database...")            { %x(rails db:drop) }
      show_spinner("Create database...")          { %x(rails db:create) }
      show_spinner("Migrate database...")         { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "You need to be on development environment to perform this task"
    end
  end

  desc "Create coins"
  task add_coins: :environment do
    show_spinner("Creating coins...") do
      coins = [{  
                  description: "Bitcoin", 
                  acronym: "BTC",
                  url_image: "https://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"
                  },
                  {
                  description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/628px-Ethereum_logo_2014.svg.png"
                  }, 
                  {   
                  description: "Dash",
                  acronym: "DASH",
                  url_image: "https://pngimage.net/wp-content/uploads/2018/05/dash-coin-logo-png-6.png"
                  }, 
                  {   
                  description: "Iota",
                  acronym: "IOT",
                  url_image: "https://criptohub.com.br/assets/svg/svg008.svg"
                  }, 
                  {   
                  description: "ZCash",
                  acronym: "ZEC",
                  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png"
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
