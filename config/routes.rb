MuseumMs::Application.routes.draw do

  scope :admin do
    devise_for :users
  end

  root 'admin_pages#index'

end
