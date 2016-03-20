Rails.application.routes.draw do

  devise_for :users

  resources :wikis
  resources :subscriptions, only: [:new, :create, :delete, :destroy]
  resources :collaborations
  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
