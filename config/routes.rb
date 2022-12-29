Rails.application.routes.draw do
  root "people#index"

  resources :people, :addresses, :emails, :phone_numbers
end