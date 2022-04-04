Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'update', to: 'sessions#airtable_update', as: 'update'
  delete 'logout' => 'sessions#destroy'
  resources :announcements
  resources :tasks
end
