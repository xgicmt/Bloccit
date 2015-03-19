Rails.application.routes.draw do
  
  resources :posts
  
  get 'about' => 'welcome#about'
  #This changes the default home page
  root to: 'welcome#index'
end
