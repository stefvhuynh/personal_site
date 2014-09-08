Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy], path_names: { new: '' }
  resources :posts do
    get 'search', on: :collection
  end
  
  root to: 'static_pages#home'
end
