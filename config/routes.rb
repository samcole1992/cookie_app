Rails.application.routes.draw do
  devise_for :users

  root "users#index"

  namespace :api do
    namespace :v1 do
      resources :orders
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users do
       resources :reviews
     end
    end
  end
  resources :users do
    resources :reviews
  end
  resources :orders
  resources :charges
end
