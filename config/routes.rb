Rails.application.routes.draw do
  resources :groups, only: %i[index]
  root 'static_pages#home'
  resources :users
end
