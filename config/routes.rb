Rails.application.routes.draw do

  resources :schools
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  
  root 'home#index'
  get 'home/dashboard'
  get 'users/adding/add_users'
  get 'users/adding/add_users_manually'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
