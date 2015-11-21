Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'
  resources :lists do
    resources :tasks, only: [:create, :destroy]
    post 'task-status/:id', to: 'tasks#status'
  end
  get 'public-view/:slug', to: 'lists#public_view', as: 'public_view'
end
