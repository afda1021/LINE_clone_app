Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'
  root 'static_pages#home'
  resources :users
  resources :groups, only: %i[index new create]
end
