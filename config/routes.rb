Rails.application.routes.draw do

  devise_for :users

  resources :wikis do
    resources :collaborations, only: [:create, :destroy]
  end
  resources :subscriptions, only: [:new, :create, :delete, :destroy]
  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
