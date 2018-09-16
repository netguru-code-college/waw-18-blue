Rails.application.routes.draw do
  resources :events, :locations, :ratings

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }
<<<<<<< HEAD
  root 'locations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======

  # # root 'devise/sessions#new'
  # devise_scope :user do
  #   get "/" => "devise/sessions#new"
  # end

>>>>>>> 7f0c2dd6ab3c7a78f6dc0c655fb90fc5b3de1c86
end
