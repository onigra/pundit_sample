PunditSample::Application.routes.draw do
  devise_for :users, skip: [:sessions]

  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    get 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: "home#index"
  resources :roles
  resources :users
  get '*not_found' => 'application#render_404'
end
