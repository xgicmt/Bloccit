Rails.application.routes.draw do
  
  devise_for :users
  resources :posts
  
  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end
  
  
  get 'about' => 'welcome#about'
  #This changes the default home page
  root to: 'welcome#index'
end
