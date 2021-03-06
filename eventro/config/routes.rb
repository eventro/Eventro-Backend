Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :create, :update] do
    get "/attendees", to: "attendees#index_user"
    get "/followers", to: "follows#indexforfollowees"
    get "/followees", to: "follows#indexforfollowers"
    get "/countfollowers", to: "follows#countforfollowers"
    get "/countfollowees", to: "follows#countforfollowees"
    post "/followers", to: "follows#create"
    delete "/followers", to: "follows#destroy"
    # resources :follows, only: [:create, :destroy], shallow: true
  end

  resources :organizers, only: [:show, :create, :update, :destroy] do
    resources :events, shallow: true do
      resources :comments, only: [:index, :create, :destroy], shallow: true
      resources :event_images, only: [:create, :destroy, :index], shallow: true
      resources :likes, only: [:create], shallow: true
      resources :attendees, only: [:create], shallow: true
      delete "/likes", to: "likes#destroy"
      delete "/attendees", to: "attendees#destroy"
      get "/countlikes", to: "likes#count"
      get "/attendees", to: "attendees#index_event"
      get "/countattendees", to: "attendees#count"
    end
    get "/countevents", to: "events#count_events"
  end

  get "/organizers", to: "organizers#index"
  get "/users", to: "users#index"
  get "/events", to: "events#all_events"
  post "/login", to: "sessions#create"
  post "/signin", to: "sessions#org_login"
end
