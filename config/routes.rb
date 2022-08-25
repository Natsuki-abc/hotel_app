Rails.application.routes.draw do

  root :to => 'users#index'

  resources :bookings
  resources :registers do
    collection do
      get 'search'
    end
  end
  
  #アカウント情報更新設定
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
