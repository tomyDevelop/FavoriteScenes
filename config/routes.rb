Rails.application.routes.draw do
  root 'pages#top'
  resources :users, only: ['new', 'create', 'edit', 'update'] do
    resource :profile, only: ['new', 'create']
    resources :interests, only: ['create']
  end
  resources :scene_collections, only: ['new', 'create', 'edit', 'update', 'show', 'index'] do
    post 'video_check', on: :collection
    post 'video_check', on: :member
    resources :scenes, only: ['create']
  end
  get 'my_scene_collections', to: 'scene_collections#my_index'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
