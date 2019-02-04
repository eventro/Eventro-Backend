Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :create, :update] do
    get "/attendees", to: "attendees#index_user"
  end

  resources :organizers, only: [:show, :create, :update] do
    resources :events, shallow: true do
      resources :comments, only: [:index, :create, :destroy], shallow: true
      resources :event_images, only: [:create, :destroy, :index], shallow: true
      resources :likes, only: [:create, :destroy], shallow: true
      resources :attendees, only: [:create, :destroy], shallow: true
      get "/likes", to: "likes#count"
      get "/attendees", to: "attendees#index_event"
      get "/attendees/count", to: "attendees#count"
    end
    get "/countevents", to: "events#count_events"
  end

  get "/events", to: "events#all_events"
  post "/login", to: "sessions#create"
  post "/signin", to: "sessions#org_login"
end
