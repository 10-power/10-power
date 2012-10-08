PowerOf10::Application.routes.draw do
  namespace :admin do
    resources :essays do
      resources :photos
    end
    resources :users

    root :to => 'dashboard#index'
  end

  resources :essays, :only => [ :index, :show ] do
    collection do
      get :random
    end
  end

  root :to => 'general#index'
end
