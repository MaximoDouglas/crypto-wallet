namespace :dev do
  desc "Setup the development environment1"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Drop database...")            { %x(rails db:drop) }
      show_spinner("Create database...")          { %x(rails db:create) }
      show_spinner("Migrate database...")         { %x(rails db:migrate) }
      show_spinner("Execute seed on database...") { %x(rails db:seed) }
    else
      puts "You need to be on development environment to perform this task"
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
