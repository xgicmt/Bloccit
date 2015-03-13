Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'
  
  get 'welcome/contact'
  #This changes the default home page
  root to: 'welcome#index'
end
