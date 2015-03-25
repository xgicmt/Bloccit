Rails.application.routes.draw do

resources :posts do
  resources :summaries 
end

  devise_for :users
  
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
