Rails.application.routes.draw do
  devise_for :users
  root to: "coroas#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :coroas, only: [:index]
  resources :pedidos, only: [:new, :create, :show, :index] do
    resources :pagamentos, only: [:edit]
  end
  resources :pagamentos, only: [:show, :update]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
