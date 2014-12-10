Rails.application.routes.draw do
  devise_for :users

  resources :advertisments do
    resources :comments, :only => [:create, :new, :edit, :update, :destroy]
    member do
      put :change_state
    end
    collection do
      get :cities_for_select
      get :models_for_select
      get :search
      get :autocomplete
    end
  end

  authenticated :user, lambda { |u| u.role == 'admin' } do
    namespace :admin do
      resources :dashboard, only: :index
      resources :users
      resources :types, :countries, :cities, :conditions, :styles, :mileages, :years, :engines, :engine_volumes, :transmissions, 
                :doors, :colors, :makes, :models, :features, except: :show
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
