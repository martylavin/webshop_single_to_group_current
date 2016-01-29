WebshopFive::Application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root "sessions#new"
 
    #get "userspam/spam_all_users" => "userspam#spam_all_users", :as => "spam_all_users"
  resources :users
  resources :admins
  get "user/:id/mail" => "users#mail", :as => "mail_user"
  get "user/spam" => "users#spam", :as => "spam_users"
end

Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'admins#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
end