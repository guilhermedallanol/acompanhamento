Rails.application.routes.draw do
  root to: "dashboard#show"

  resources :weights,          only: [:index, :destroy, :new, :create]
  resources :perimeters,       only: [:index, :destroy, :new, :create]
  resources :hungers,          only: [:index, :destroy, :new, :create]
  resources :daily_activities, only: [:index, :destroy, :new, :create]
  resources :priorities,       only: [:index, :destroy, :new, :create]
end
