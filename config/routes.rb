Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :places      
      resources :users do
        resources :reservations, only: [:index]
      end
      post '/login', to: 'sessions#create'
    end
  end
end
