Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'
  resources :lists do
    resources :tasks, only: [:index, :create, :destroy]
    post 'task-status/:id', to: 'tasks#status'
  end
end
