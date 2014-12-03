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
      resources :users
      resources :types, except: :show
      resources :countries, except: :show
      resources :cities, except: :show 
      resources :conditions, except: :show
      resources :styles, except: :show
      resources :mileages, except: :show
      resources :years, except: :show
      resources :engines, except: :show
      resources :engine_volumes, except: :show
      resources :transmissions, except: :show
      resources :doors, except: :show
      resources :colors, except: :show
      resources :makes, except: :show
      resources :models, except: :show
      resources :features, except: :show

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
