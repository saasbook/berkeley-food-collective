Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'tasks/create' => 'tasks#create'
  post 'tasks/clear' => 'tasks#clear'
  post 'checkmark' => 'tasks#checkmark'
  delete 'logout' => 'sessions#destroy'
  post 'filter' => 'tasks#filter'
  resources :announcements
  resources :tasks
end
