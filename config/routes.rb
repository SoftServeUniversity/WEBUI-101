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
  end
  root 'pages#index'

end
