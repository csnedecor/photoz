Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  resources :users, only: [:show]

  resources :albums do
    resources :photos, only: [:show, :edit, :update]
    resources :analytics, only: [:index]
    resources :visits, only: [:index]
  end

  root 'albums#index'
end
