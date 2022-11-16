Rails.application.routes.draw do
  devise_for :students
  resources :class_lists
  resources :professors
  resources :departments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
