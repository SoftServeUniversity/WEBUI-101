MuseumMs::Application.routes.draw do

  namespace :admin do
    root 'pages#index'

    concern :revertable do
      resources :versions, only: [:index]
    end

    resources :versions, only: [] do
      post :revert, on: :member
    end

    resources :exhibitions, concerns: :revertable do
      post 'add_exhibit', on: :member
      post 'remove_exhibit', on: :member
    end

    resources :museums
    resources :articles, concerns: :revertable
    resources :exhibits, concerns: :revertable
    resources :editor_images
    resources :markdown_images
    resources :tags
    resources :properties
    devise_for :users, controllers: {invitations: 'admin/users/invitations', sessions: 'admin/users/sessions'}
    resources :users, only: [:index, :edit, :update, :destroy]
  end

  resources :articles, only: [:index, :show]
  resources :exhibitions, only: [:index, :show]
  resources :exhibits, only: [:index, :show]
  root 'pages#index'

  resources :search, only: [:index]

end
