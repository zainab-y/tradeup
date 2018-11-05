Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  root 'pages#welcome'
  get 'pages/signin', to: 'pages#signin', as: 'pages_signin'

  #user profile routes
  resources :user_profiles
  get 'user_profiles/:id/my_jobs', to: 'user_profiles#my_jobs', as: 'my_jobs'
  get 'user_profiles/:id/trades_form', to: 'user_profiles#trades_form', as: 'trades_form'

  get 'show/edit'
  get 'show/new'

  devise_for :users, controllers: { registrations: 'users/registrations'}
  
  resources :jobs
  get 'jobs/:id/accept', to: 'jobs#accept', as: 'jobs_accept'
  get 'jobs/:id/complete', to: 'jobs#complete', as: 'jobs_complete'
  get 'jobs/:id/pay', to: 'jobs#pay', as: 'jobs_pay'

  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
