Rails.application.routes.draw do
  root 'static_pages#home'
  get 'users/index'
  get 'users/new'
  post 'users/create'
end
