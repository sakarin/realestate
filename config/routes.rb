Realestate::Application.routes.draw do

  root :to => 'home#index'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
             controllers: {omniauth_callbacks: "omniauth_callbacks"}

  devise_for :users

  match "/dynamic_amphurs/:id" => "account/listings#dynamic_amphurs", :via => :post
  match "/dynamic_districts/:id" => "account/listings#dynamic_districts", :via => :post

  match "account/listings/:id/progress_trackers/:step" => "account/listings#progress_trackers", :via => :get
  match "account/listings/progress_trackers/:step" => "account/listings#progress_trackers", :via => :get

  match "/account" => "account/listings#index", :via => :get
  match "/admin" => "admin/home#index", :via => :get


  namespace :admin do

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

  end

  namespace :account do
    resources :users
    resources :listings
    resources :images
  end



end
