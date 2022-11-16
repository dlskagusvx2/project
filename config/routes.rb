Rails.application.routes.draw do
  resources :bbbs
  devise_for :aaas
  devise_for :attendees
  resources :class_lists
  resources :professors
  resources :departments
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
