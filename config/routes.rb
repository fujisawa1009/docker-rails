Rails.application.routes.draw do
  root 'boards#index'
  resources :boards
  resources :comments, only: %i[create destroy]
end
