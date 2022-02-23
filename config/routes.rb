Rails.application.routes.draw do
  #root 'boards#index'
  get 'boards', to: 'boards#index'
end
