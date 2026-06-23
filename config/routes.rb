Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :articles
  resources :comments
  get "up" => "rails/health#show", as: :rails_health_check
end