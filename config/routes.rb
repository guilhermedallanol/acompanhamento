Rails.application.routes.draw do
  root to: "dashboard#show"

  resources :weights, only: [:index, :destroy, :new, :create]
end
