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
    resources :tags
    devise_for :users, controllers: {invitations: 'admin/users/invitations', sessions: 'admin/users/sessions'}
  end

end
