Rails.application.routes.draw do
  devise_for :users

  resources :advertisments do
    resources :comments, :only => [:create, :new, :edit, :update, :destroy]
    member do
      put :change_state
    end
    collection do
      get :search
      get :autocomplete
    end
  end

  authenticated :user, lambda { |u| u.role == 'admin' } do
    namespace :admin do
      resources :users
      resources :types, except: :show
      resources :countries, except: :show
      resources :cities, except: :show
      resources :advertisments do
        member do
          put :change_state
        end
        collection do
          put :multiple_change_state
          get :moderation
          get :search
        end
      end
    end
  end

  resources :users do
    resources :reviews
    member do
      get :search
    end
  end

  root to: 'advertisments#index'

end
