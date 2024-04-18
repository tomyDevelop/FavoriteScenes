Rails.application.routes.draw do
  # get 'user_sessions/new'
  # get 'user_sessions/create'
  # get 'user_sessions/destroy'
  # get 'pages/top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
