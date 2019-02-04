Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # post "/users", to: "users#create"
  # get "/users/:id", to: "users#show"
  # post "/login", to: "sessions#create"
  # put "/users/:id", to: "users#update"

  resources :users, only: [:show, :create, :update]
  # resources :users , shallow: true

  # resources :users do
  #   resources :events, only: [:user_events, :remove_event]
  #   end

  resources :organizers, only: [:show, :create, :update]

  resources :organizers do
    resources :events, only: [:index, :create, :update, :destroy, :show] do
      resources :comments 
  end

  resources :organizers do
    resources :events do
      resources :event_images, only: [:create, :destroy]
    end
  end

  get "/events", to: "events#all_events"
  get "/events/:id", to: "events#show"
  get "/events/:id/event_images", to: "event_images#index"
end
