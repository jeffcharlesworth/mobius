Rails.application.routes.draw do

  devise_for :users
  resources :transactions, only: [:create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :index
    end
  end

  root 'transactions#new'


end
