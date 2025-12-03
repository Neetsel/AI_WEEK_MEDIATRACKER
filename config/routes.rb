Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:show]
  resources :likes, only: [:index, :destroy]
  resources :seen_movies, only: [:index, :destroy]

  resources :planned_movies, only: [:index, :destroy]

  resources :chats, only: [:show]

  resources :movies, only: [:show, :index] do
    resources :seen_movies, only: [:create]
    resources :chats, only: [:create]
    resources :planned_movies, only: [:create]
    resources :likes, only: [:create]

  end
  # Defines the root path route ("/")
  # root "posts#index"
end
