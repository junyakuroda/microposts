Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  
  #課題のため、ここを修正
  resources :users do
   member do
    get 'followings'
    get 'followers'
   end
  end
  #ここまで修正
  
  resources :sessions, only: [:new, :create, :destroy] 
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
