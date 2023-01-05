Rails.application.routes.draw do
  root "main#index"

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  resources :people do
    resources :addresses, :emails, :phone_numbers
  end
end