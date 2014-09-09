Rails.application.routes.draw do
  devise_for :users
  resources :advertisments do
    member do
      put :change_state
    end
    collection do
      put :multiple_change_state
      get :search
    end

  end
  authenticated :user, lambda { |u| u.role == 'admin' } do
    namespace :admin do
      resources :users 
      resources :types
      resources :advertisments do 
        collection do
          get :moderation
          get :search
        end
      end
    end
  end
  resources :users do
    member do 
      get :search
    end
  end
  root to: 'advertisments#index'

end
