Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :groups, except: [:update, :show] do
    resources :accounts,  only: [:index, :new, :create, :destroy, :update]
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
