Rails.application.routes.draw do
  root to: "ideas#index"
  resources :users, only: [:index, :new, :create, :show] do
    resources :ideas, only: [:new, :show, :create, :destroy ]
  end
  
  resources :sessions, only: [:new]
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  namespace :admin do
    resources :categories, only: [:index]
  end

end
