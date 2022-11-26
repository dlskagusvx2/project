Rails.application.routes.draw do
  resources :class_statuses
  devise_for :students
  resources :class_lists

  resources :professors
  resources :departments
	get '/class_statuses/:id/retake', to: 'class_statuses#retake', as: :class_statuses_retake
	get '/class_statuses/:id/reserve_to_apply', to: 'class_statuses#reserve_to_apply', as: :class_statuses_reserve_to_apply
	get '/class_lists/mainpage', to: 'class_lists#mainpage', as: :class_lists_mainpage
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'class_lists#mainpage'
end
