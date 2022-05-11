Rails.application.routes.draw do
  resources :groups, only: %i[index]
end
