Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
<<<<<<< HEAD
  get 'logout' => 'sessions#destroy'
=======
  post 'logout' => 'sessions#destroy'
>>>>>>> dc8d77f71cdabded9bc43a71a0e7845978ba059c
  resources :announcements
  resources :tasks
end
