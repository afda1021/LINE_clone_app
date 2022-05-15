Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  root 'static_pages#home'
  resources :users
  resources :groups, only: %i[index new create]
end
