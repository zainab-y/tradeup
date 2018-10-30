Rails.application.routes.draw do
  #user profile routes
  # get 'user_profile', to: 'user_profile#new' I dont think I will need a new page because the user profile will automatically be created when user signs up. They then can go to the edit page to add additional info

  get 'user_profile/:id', to: 'user_profile#show'
  get 'user_profile/:id/edit', to: 'user_profile#edit'
  post 'user_profile/:id', to: 'user_profile#update'

  get 'show/edit'
  get 'show/new'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :jobs
  root 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
