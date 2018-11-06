Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :games, only: [:create, :show] do
        post "/deal", to: 'hands#create'
        get '/current_hand', to: 'hands#show'
        post '/current_hand/moves', to: 'moves#create'
      end
      post "/login", to: "sessions#create"
    end
  end
end
