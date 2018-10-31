Rails.application.routes.draw do
  #user profile routes
  resources :user_profiles
  get 'user_profiles/:id/my_jobs', to: 'user_profiles#my_jobs', as: 'my_jobs'

  get 'show/edit'
  get 'show/new'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :jobs
  get 'jobs/:id/accept', to: 'jobs#accept', as: 'jobs_accept'

  root 'pages#welcome'

  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
