Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # post "/users", to: "users#create"
  # get "/users/:id", to: "users#show"
  # post "/login", to: "sessions#create"
  # put "/users/:id", to: "users#update"

  resources :users ,only: [:show, :create , :update]

  resources :organizers ,only: [:show, :create , :update]

  resources :organizers do
  resources :events, only: [:index, :create , :update]
  end

# resources :events, only: [:show, :index]
get "/events", to: "events#all_events"
  # resources :users , shallow: true


end
