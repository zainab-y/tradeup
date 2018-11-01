Rails.application.routes.draw do
  #user profile routes
  resources :user_profiles
  get 'user_profiles/:id/my_jobs', to: 'user_profiles#my_jobs', as: 'my_jobs'
  get 'user_profiles/:id/trades_form', to: 'user_profiles#trades_form', as: 'trades_form'

  get 'show/edit'
  get 'show/new'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :jobs
  get 'jobs/:id/accept', to: 'jobs#accept', as: 'jobs_accept'
  get 'jobs/:id/completed', to: 'jobs#completed', as: 'jobs_completed'

  root 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
