Rails.application.routes.draw do
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
root 'sessions#index'
post "sessions/new" ,to: 'sessions#create'
  resources :posts , only: [:new, :create, :index]
  match '/signout', to: 'sessions#destroy', via: :delete
  post "posts/new" ,to: 'posts#create'
end
