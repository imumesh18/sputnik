Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/sign_up' => 'sign_up#index'
  get '/login' => 'login#index'
end
