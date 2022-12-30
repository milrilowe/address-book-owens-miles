Rails.application.routes.draw do
  root "people#index"

  resources :people do
    resources :addresses, :emails, :phone_numbers
  end
end