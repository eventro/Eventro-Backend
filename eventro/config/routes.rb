Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:create , :destroy]
  
  post "/users/register", to: "users#create"
  get "/users/:id", to: "users#show"
  get "/users", to: "users#index"
end
