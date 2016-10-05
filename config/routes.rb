Rails.application.routes.draw do
  root to: 'users#index'
  get 'users(/:type)', to: 'users#index', as: :users
end
