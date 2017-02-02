Rails.application.routes.draw do
  devise_for :users

  root "users#index"

  namespace :api do
      namespace :v1 do
        resources :reviews
      end
    end
  resources :users do
    resources :reviews
  end
  resources :orders

end
