Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'
  #This changes the default home page
  root to: 'welcome#index'
end
