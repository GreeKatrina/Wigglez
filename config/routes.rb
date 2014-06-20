Wigglez::Application.routes.draw do
  root :to => "sessions#new"

  get 'sign_in', :to => 'sessions#sign_in_form', :as => :sign_in_form
  post 'sign_in', :to => 'sessions#sign_in', :as => :sign_in
  get 'sign_up', :to => 'sessions#sign_up_form', :as => :sign_up_form
  post 'sign_up', :to => 'sessions#sign_in', :as => :sign_up
  get 'log_out', :to => 'sessions#destroy', :as => :log_out

  get 'home', :to => 'users#index', :as => :home
  get 'profile', :to => 'users#show', :as => :profile

  get 'wigs', :to => 'wigs#index', :as => :wigs
  get 'wigs/:id', :to => 'wigs#show', :as => :show_wig

  resources :users, :only => [:update, :destroy] do
    resources :wigs, :except => [:index, :show]
  end

end
