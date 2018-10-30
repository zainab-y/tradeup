Rails.application.routes.draw do
  get 'user_profile/new'
  get 'user_profile/show'
  get 'user_profile/edit'
  get 'show/edit'
  get 'show/new'
  devise_for :users
  resources :jobs
  root 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
