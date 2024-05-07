Rails.application.routes.draw do
  root 'pages#top'
  resources :users, only: ['new', 'create', 'edit', 'update', 'show'] do
    resource :profile, only: ['new', 'create', 'edit', 'update']
    resources :interests, only: ['create']
  end
  resources :scene_collections do
    resources :scenes
    resources :comments, only: ['create', 'edit', 'update', 'destroy', 'show']
  end
  get 'my_scene_collections', to: 'scene_collections#my_index'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
