Rails.application.routes.draw do
  root 'users#home'
  get 'signup', to: 'users#signup', as: 'signup'
  get 'login', to: 'sessions#login', as: 'login'
  get 'logout', to: 'sessions#logout', as: 'logout'
  get 'profile', to: 'sessions#profile', as: 'profile'
  get 'users/verify/:token', to: 'users#verify'
  resources :users, :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
