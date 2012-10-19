Realestate::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
             controllers: {omniauth_callbacks: "omniauth_callbacks"}

  devise_for :users

  root :to => 'home#index'
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

  end



end
