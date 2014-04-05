PunditSample::Application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :roles
  resources :users
end
