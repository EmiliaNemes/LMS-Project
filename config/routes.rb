Rails.application.routes.draw do

  resources :schools
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  
  root 'home#index'
  get 'home/dashboard'
  get 'home/show_users'
  get 'users/adding/add_users_manually'
  get 'users/adding/add_users_from_file'
  get 'users/adding/import_users'
  get 'users/adding/save_users'
  get 'users/adding/save_changes'
end
