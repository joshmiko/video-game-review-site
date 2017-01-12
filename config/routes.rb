Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'

  resources :games do
    resources :reviews
  end

  namespace :admin do
    resources :users, except: [:new, :edit, :update]
    resources :games, except: [:new, :edit, :update]
    resources :reviews, except: [:new, :edit, :update]
    resources :home, only: [:index]


  end

end
