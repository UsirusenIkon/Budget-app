Rails.application.routes.draw do
  devise_for :user
  # get 'groups/index'

  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    resources :accounts, only: [:index, :new, :create, :show, :destroy]
  end
  resources :users
  resources :home
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "groups#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
