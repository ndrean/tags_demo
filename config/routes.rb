Rails.application.routes.draw do

  get 'restaurants/new'
  get 'restaurants/create'
  
  devise_for :users
  root to: 'restaurants#index'
  get '/tagged', to: "restaurants#tagged", as: :tagged
  resources :restaurants, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
