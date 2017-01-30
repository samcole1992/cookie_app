Rails.application.routes.draw do
  devise_for :providers
  devise_for :consumers

  resources :providers
  resources :consumers
  resources :orders 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
