MuseumMs::Application.routes.draw do

  

  scope :admin do
    resources :exhibitions do
      post 'add_exhibit', on: :member
      post 'remove_exhibit', on: :member
    end

    
    resources :exhibits, :biographies 
    resources :tags
    devise_for :users, controllers: { invitations: 'users/invitations' }
  end

  root 'admin_pages#index'

end
