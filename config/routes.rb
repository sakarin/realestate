Realestate::Application.routes.draw do





  get "notification/edit"

  mount RedactorRails::Engine => '/redactor_rails'

  root :to => 'listings#index'


  #devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  #, controllers: { omniauth_callbacks: "user_registrations", registrations: "user_registrations"  }

  devise_for :users, :controllers => { :registrations => 'user_registrations' }

  devise_scope :user do

  end


  match "/dynamic_amphurs/:id" => "account/listings#dynamic_amphurs", :via => :post
  match "/dynamic_districts/:id" => "account/listings#dynamic_districts", :via => :post

  match "account/listings/:id/progress_trackers/:step" => "account/listings#progress_trackers", :via => :get
  match "account/listings/progress_trackers/:step" => "account/listings#progress_trackers", :via => :get

  match "/account" => "account/listings#index", :via => :get
  match "/admin" => "admin/home#index", :via => :get




  resources :users

  resources :listings do
    resources :comments
  end


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
  #resources :images



end
