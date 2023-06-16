Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :show]
  resources :recipes

  resources :recipes do
    resources :likes, only: [:create, :destroy]
  end

  get 'users/new'
  get 'users/create'
  get 'users/:id', to: 'users#show', as: 'user'


  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  get 'recipes', to: 'pages#recipes'
  get 'add_recipe', to: 'pages#addrecipe'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Add more routes as needed
end
