MuseumMs::Application.routes.draw do
  namespace :admin do
    root 'pages#index'
    resources :museums

    resources :exhibitions do
      post 'add_exhibit', on: :member
      post 'remove_exhibit', on: :member
    end
    resources :articles
    resources :exhibits
    resources :tags
    resources :properties
    devise_for :users, controllers: {invitations: 'admin/users/invitations', sessions: 'admin/users/sessions'}
  end
  root 'pages#index'

  resources :tags, only: [:show, :index] do
    member do
      get :list
      get :timeline
    end
  end

end
