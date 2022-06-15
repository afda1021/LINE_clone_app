Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'static_pages#home'
  resources :users do
    get :search, on: :collection
    post :search, on: :collection
    resources :friendships, only: %i[create] 
  end
  resources :groups, only: %i[index new create]
end
