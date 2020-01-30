Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users  do
   member do
      get 'edit_basic'
      patch 'update_basic'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month' # この行が追加対象です。
    end
  resources :attendances  
  end 
end
