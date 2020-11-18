Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # devise_scope :user do
      #   resources :sessions, only: [:create, :logout]
      # end
      resources :users
      resources :sessions, only: [:create, :destroy]
    end
  end
  # resources :sessions, only: [:create, :logout]
end
