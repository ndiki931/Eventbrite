Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :events
  resources :users
  get 'events/subscribe_to_event'
  get 'static_pages/index'
  get 'static_pages/secret'
end
