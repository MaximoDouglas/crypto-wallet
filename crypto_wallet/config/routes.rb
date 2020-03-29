Rails.application.routes.draw do
  get 'welcome/index'
  get '/inicio', to: 'welcome#index'

  resources :coins

  # To declare a custom route, you can do as following
  # get '/coins', to: 'coins#index'
  # where '/coins' is the route, 'coins' is the controller and 'index' is the action

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
