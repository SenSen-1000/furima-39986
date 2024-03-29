Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "items#index"
  resources :items do
    resources :addresses, only:[:index, :create]
  end
end
