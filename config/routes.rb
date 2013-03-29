Realestate::Application.routes.draw do

  get "notification/edit"

  mount RedactorRails::Engine => '/redactor_rails'

  root :to => 'listings#index'

  devise_for :users, :controllers => { :registrations => 'user_registrations', :sessions => 'sessions' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users

  match "/dynamic_amphurs/:province_id" => "account/listings#dynamic_amphurs", :via => :post
  match "/amphurs/:province_id" => "listings#dynamic_amphurs", :via => :post

  match "/dynamic_districts/:amphur_id" => "account/listings#dynamic_districts", :via => :post

  match "account/listings/:id/progress_trackers/:step" => "account/listings#progress_trackers", :via => :get
  match "account/listings/progress_trackers/:step" => "account/listings#progress_trackers", :via => :get

  match "/account" => "account/listings#index", :via => :get
  match "/admin" => "admin/users#index", :via => :get

  resources :listings do
    collection do
      match 'search' => 'listings#search', :via => [:get, :post], :as => :search
    end
    resources :comments
  end


  namespace :admin do

    #resources :home

    resources :users do
      collection do
        post :multi_destroy
      end
    end
    resources :unit_features do
      collection do
        post :multi_destroy
      end
    end
    resources :furnitures do
      collection do
        post :multi_destroy
      end
    end
    resources :free_spaces do
      collection do
        post :multi_destroy
      end
    end
    resources :facilities do
      collection do
        post :multi_destroy
      end
    end

    resources :post_groups do
      collection do
        post :multi_destroy
      end
    end

    resources :posts do
      collection do
        post :multi_destroy
      end
    end

    resources :experts do
      collection do
        post :multi_destroy
      end
    end

  end

  namespace :account do
    resources :users
    resources :contact
    resources :profile
    resources :notification

    resources :listings do
      resources :images do
        collection { post :sort }
      end
    end

    resources :inbox do
      collection do
        post :multi_keep

      end
    end
  end

end
