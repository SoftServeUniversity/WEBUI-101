MuseumMs::Application.routes.draw do

  namespace :admin do
    root 'pages#index'
    resources :exhibitions do
      post 'add_exhibit', on: :member
      post 'remove_exhibit', on: :member
    end

    resources :exhibits
    resources :tags
    devise_for :users, controllers: {invitations: 'admin/invitations', sessions: 'admin/sessions'}
  end

end
