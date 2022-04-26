Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'checkmark' => 'tasks#checkmark'
  post 'logout' => 'sessions#destroy'
  post 'update' => 'sessions#update'

  resources :announcements
  resources :tasks
end