Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]
  
  resources :topics do
    resources :posts, except: [:index]
  end
  
  authenticated :user do
    root to: 'topics#index', as: :authenticated_root
  end
  
  get 'about' => 'welcome#about'
  #This changes the default home page
  root to: 'welcome#index'
end
