Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  root to: 'addresses#index'
  resources :addresses, only:[:create]
end
