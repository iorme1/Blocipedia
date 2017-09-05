Rails.application.routes.draw do

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end


  resources :charges, only: [:new, :create]

  resources :downgrades, only: [:create]

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
