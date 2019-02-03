Rails.application.routes.draw do
  devise_for :organizers
  devise_for :users  

  resources :sessions, only: [:create , :destroy]
  
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"
  get "/users", to: "users#index"

  get "/events", to: "events#index"
  get "/cups", to: "cups#index"
end
