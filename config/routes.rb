MuseumMs::Application.routes.draw do

  scope :admin do
    resources :exhibitions
    resources :exhibits
    devise_for :users, controllers: { invitations: 'users/invitations' }
  end

  root 'admin_pages#index'

end
