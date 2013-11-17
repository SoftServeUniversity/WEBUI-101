MuseumMs::Application.routes.draw do

  scope :admin do
    resources :exhibits
    resources :tags
    devise_for :users
  end

  root 'admin_pages#index'

end
