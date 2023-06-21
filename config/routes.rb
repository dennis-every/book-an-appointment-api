Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :places
      resources :reservations, only: [:create, :show]
      resources :users do
        resources :reservations, only: [:index]
      end
      post '/login', to: 'sessions#create'
      post '/signup', to: 'registrations#create' 
    end
  end
end
