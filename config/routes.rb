Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  resources :groups, only: %i[index new create]
end
