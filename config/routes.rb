Rails.application.routes.draw do
  devise_for :user

  # Define root paths for authenticated and unauthenticated users
  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
  
  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    resources :accounts, only: [:index, :new, :create, :show, :destroy]
  end
  resources :home
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
