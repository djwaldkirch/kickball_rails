Rails.application.routes.draw do
  
  resources :teams

  resources :players, only: [:edit, :update, :destroy]
  get 'teams/:id/add_player', to: 'players#new', as: :new_player
  post 'teams/:id/add_player', to: 'players#create', as: :create_player
  
  resources :games, only: [:index, :edit, :show, :update, :destroy]
  get 'teams/:id/add_game', to: 'games#new', as: :new_game
  post 'teams/:id/add_game', to: 'games#create', as: :create_game
  
  
  post 'games/:id/', to: 'games#generate_lineup', as: :generate_button
  post 'games/:id/', to: 'games#save_lineup', as: :save_button
  
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  unauthenticated do
     root :to => 'pages#index'
  end
  
  authenticated do
    root :to => 'dashboards#index'
  end
end
