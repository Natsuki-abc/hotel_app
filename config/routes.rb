Rails.application.routes.draw do
  resources :bookings
  resources :registers do
    collection do
      get 'search'
    end
  end
  
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
