Rails.application.routes.draw do
  root to: "dashboard#show"

  resources :weights,          only: [:index]
  resources :perimeters,       only: [:index]
  resources :daily_activities, only: [:index]
  resources :hungers,          only: [:index, :destroy, :new, :create]
  resources :priorities,       only: [:index, :destroy, :new, :create]
  resources :days, only: [:new, :create] do
    member do
      resource :daily_activity, module: :days, only: [:new, :create]
      resource :weight, module: :days, only: [:new, :create]
    end
  end
end
