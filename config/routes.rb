Rails.application.routes.draw do
  
  resources :advertisements
  resources :posts
  
  get 'about' => 'welcome#about'
  #This changes the default home page
  root to: 'welcome#index'
end
