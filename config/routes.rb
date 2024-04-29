Rails.application.routes.draw do
  root 'pages#top'
  resources :users, only: ['new', 'create', 'edit', 'update'] do
    resource :profile, only: ['new', 'create']
    resources :interests, only: ['create']
  end
  resources :scene_collections, only: ['new', 'create', 'edit', 'update', 'show', 'index']
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
