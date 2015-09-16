Rails.application.routes.draw do
  root to: "ideas#index"
  resources :users, only: [:index, :new, :create, :show]
end
