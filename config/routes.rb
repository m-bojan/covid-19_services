# frozen_string_literal: true

Rails.application.routes.draw do
  root to: ->(_env) { [200, { 'Content-Type' => 'application/json' }, [{ success: true, message: 'API Server is UP' }.to_json]] }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    resources :items
    resources :states
    resources :cities
    resources :regions
    resources :pharmacies
    resources :pharmacy_items, only: %i[create update]
    resources :sessions#, only: :create
  end
end
