Rails.application.routes.draw do
  root to: "dashboard#show"

  resources :weights,          only: [:index]
  resources :perimeters,       only: [:index]
  resources :hungers,          only: [:index, :destroy, :new, :create]
  resources :daily_activities, only: [:index]
  resources :priorities,       only: [:index, :destroy, :new, :create]
end
