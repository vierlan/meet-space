Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check
  get "profile/:id", to: "pages#profile", as: :profile
  # Defines the root path route ("/")
  # root "posts#index"
  resources :venues do
    resources :bookings, except: [:show]
    resources :reviews, only: %i[new create]
  end

  resources :bookings, only: [:destroy] do
     resources :chatrooms, only: %i[index show create] do
    resources :messages, only: %i[create]
    member do
      patch :confirm
    end
  end
end
end