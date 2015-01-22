Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  resources :users, only: [:show]

  resources :albums do
    resources :analytics, only: [:index]
    resources :visits, only: [:index]
  end

  resources :photos, only: [:show, :edit, :update]

  root 'albums#index'
end
