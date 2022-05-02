Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'checkmark' => 'tasks#checkmark'
  post 'logout' => 'sessions#destroy'

  get 'settings' => 'settings#index'
  post 'settings' => 'settings#update'
  get 'update_password' => 'settings#change_password'
  post 'update_password' => 'settings#update_password'

  resources :announcements
  resources :tasks
end
