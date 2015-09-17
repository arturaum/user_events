Rails.application.routes.draw do

  get 'my_calendar' => 'my_calendar#index', as: :my_calendar

  mount FullcalendarEngine::Engine => "/calendar"

  get "register" => 'users#new', :as => "register"
  get "login" => 'user_sessions#new', :as => "login"
  get "logout" => "user_sessions#destroy", :as => "logout"
  # post ':controller/validate', action: 'validate', as: :validate_form

  resources :users
  resources :user_sessions

  root 'my_calendar#index'
  
end
