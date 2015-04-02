Rails.application.routes.draw do

  #get 'comments/create'

  devise_for :users
  resources :users, only: [:update]
 
  resources :topics do 
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  #resources :topics do
  #  resources :posts, except: [:index] do 
  #    resources :comments, only: [:create, :destroy]
  #end
#end
 # resources :posts do
 #   resources :comments, only: [:create, :destroy]
 # end
  

  authenticated :user do
    root to: 'topics#index', as: :authenticated_root
  end
  
  get 'about' => 'welcome#about'
  #This changes the default home page
  root to: 'welcome#index'
end
