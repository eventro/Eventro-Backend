Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD

  resources :users ,only: [:show, :create , :update]

  resources :organizers ,only: [:show, :create , :update] do
    resources :events, shallow: true do
    resources :event_images, shallow: true
=======

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
>>>>>>> a9f8d78f9cb17b18b819d27d48b9eacef7d76073
    end
  end

  get "/events", to: "events#all_events"
<<<<<<< HEAD
  post "/login", to: "sessions#create"
  post "/signin", to: "sessions#org_login"
=======
  get "/events/:id", to: "events#show"
  get "/events/:id/event_images", to: "event_images#index"
>>>>>>> a9f8d78f9cb17b18b819d27d48b9eacef7d76073
end
