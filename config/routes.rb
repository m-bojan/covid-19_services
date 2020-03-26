# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    resources :states
    resources :cities
    resources :regions
    resources :pharmacies
    namespace :auth, defaults: { format: :json } do
      resources :sign_in, only: :create
    end
  end
end
