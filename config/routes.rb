Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :articles
  get "up" => "rails/health#show", as: :rails_health_check
end