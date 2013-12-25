MuseumMs::Application.routes.draw do

  namespace :admin do
    root 'pages#index'
    resources :museums

    resources :exhibitions do
      post 'add_exhibit', on: :member
      post 'remove_exhibit', on: :member
    end

    resources :articles
    resources :editor_images
    resources :exhibits
    resources :markdown_images
    resources :tags
    resources :properties
    devise_for :users, controllers: {invitations: 'admin/users/invitations', sessions: 'admin/users/sessions'}
    resources :users, only: [:index, :edit, :update, :destroy]
  end
  resources :articles, only: [:index, :show]
  resources :exhibitions, only: [:index, :show]
  resources :exhibits, only: [:index, :show] do
     collection do
      get 'audio'
      get 'video'
    end
  end
  root 'pages#index'

  resources :search, only: [:index]

end
