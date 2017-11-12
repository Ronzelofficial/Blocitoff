Rails.application.routes.draw do
  devise_for :users
  get 'items/create'
  get 'welcome/index'
  get 'welcome/about'
  get 'users/show'
  resources :items, only: [:create, :destroy]
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
