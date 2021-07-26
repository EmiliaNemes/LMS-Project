Rails.application.routes.draw do

  resources :schools
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}
  
  constraints subdomain: /.+/ do
    resources :schools
  end

  # constraints subdomain: false do
  #  root 'home#index'
  # end
  
  root 'home#index'
  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
