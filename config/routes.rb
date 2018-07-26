Rails.application.routes.draw do
  get 'signup', to: 'users#signup', as: 'signup'
  get 'login', to: 'sessions#login', as: 'login'
  get 'logout', to: 'sessions#logout', as: 'logout'
  get 'profile', to: 'sessions#profile', as: 'profile'
  
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#home'
end
