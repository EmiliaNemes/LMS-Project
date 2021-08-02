Rails.application.routes.draw do

  resources :schools
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  
  root 'home#index'
  get 'home/dashboard'
  get 'users/adding/add_users'
  get 'users/adding/add_users_manually'
  get 'users/save_users/save_users'
  get 'users/adding/add_users_from_file'
  get 'users/adding/import_users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
