Rails.application.routes.draw do
  root to: 'users#index'
  get 'users(/:type)', to: 'users#index', as: :users
  get 'activities(/:user_id)', to: 'activities#index', as: :activities
  post 'activities', to: 'activities#index', as: :activities_post
end
