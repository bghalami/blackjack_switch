Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :games, only: [:create, :show]
    end
  end
end
