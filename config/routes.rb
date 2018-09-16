Rails.application.routes.draw do
  resources :events, :locations, :ratings

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'locations#index'
  # devise_scope :user do
  #   get "/" => "devise/sessions#new"
  # end

end
