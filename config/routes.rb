Rails.application.routes.draw do
  devise_for :users

  root "users#index"
  resources :users do
    resources :reviews
  end
  resources :orders
  resources :charges

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
       resources :reviews
     end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :orders
    end
  end

end
