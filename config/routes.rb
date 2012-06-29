PowerOf10::Application.routes.draw do

  get "account" => "account#index"

  resources :essays do
    collection do
      get :random
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'general#index'
end
