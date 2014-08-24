Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :posts
  
  root to: 'static_pages#home'
end
