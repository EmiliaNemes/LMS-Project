Rails.application.routes.draw do

  resources :essay_solutions
  resources :class_registers
  resources :quiz_answers
  resources :quiz_questions
  resources :attachments
  resources :essays
  resources :quizes
  resources :lessons
  resources :resources
  resources :users_courses
  resources :courses
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
  get 'courses/users_of_course/:id', to: "courses#users_of_course", :as => 'courses_users_of_course'
  get 'courses/add_users_to_course/:id', to: "courses#add_users_to_course", :as => 'courses_add_users_to_course'
  get 'courses/assign_user_to_course/:id', to: "courses#assign_user_to_course", :as => 'courses_assign_user_to_course'
  get 'courses/remove_user_from_course/:id', to: "courses#remove_user_from_course", :as => 'courses_remove_user_from_course'
  get 'courses/remove/:id', to: "courses#remove", :as => 'courses_remove'
  get 'users/registrations/save_updates', to: "users/registrations#save_updates", :as => 'users_registrations_save_updates'
  get 'assignment_creation', to: "home#assignment_creation", :as => 'assignment_creation'
  get 'choose_type', to: "home#choose_type", :as => 'choose_type'
end
