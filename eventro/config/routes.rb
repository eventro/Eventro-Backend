Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users ,only: [:show, :create , :update]

  resources :organizers ,only: [:show, :create , :update] do
    resources :events, shallow: true do
    resources :event_images, shallow: true
    end
  end
  
  get "/events", to: "events#all_events"
  post "/login", to: "sessions#create"
  post "/signin", to: "sessions#org_login"
end
