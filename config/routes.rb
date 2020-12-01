Rails.application.routes.draw do
  devise_for :users
  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #     resources :users, only: [:show, :create, :update, :destroy]
  #     resources :sessions, only: [:create, :destroy]
  #   end
  # end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'sign_up', to: 'users#create'
      # get 'user_profile', to: 'users#show'
      post 'sign_in', to: 'sessions#create'
      delete 'logged_out', to: 'sessions#destroy'
      # post 'sign_up', to: 'users#update'
      # patch 'sign_up', to: 'users#update'
      post 'sign_up', to: 'users#create'
      resources :users, only: [:show, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
    end
  end
end
