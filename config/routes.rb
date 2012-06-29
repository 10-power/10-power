PowerOf10::Application.routes.draw do
  resources :essays

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'general#index'
end
