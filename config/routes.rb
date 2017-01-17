Rails.application.routes.draw do
  devise_for :users
  root 'games#index'

  resources :games do
    resources :reviews
  end
  resources :votes, only: [:create]



  namespace :admin do
    resources :users, except: [:new, :edit, :update]
    resources :games, except: [:new, :edit, :update]
    resources :reviews, except: [:new, :edit, :update]
    resources :home, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :votes, only: [:create]
    end
  end
end
