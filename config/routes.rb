Wigglez::Application.routes.draw do
  root :to => "sessions#new"

  get 'contact_us', :to => 'static_pages#contact_us', :as => :contact_us
  get 'about_us', :to => 'static_pages#about_us', :as => :about_us

  get 'sign_in', :to => 'sessions#sign_in', :as => :sign_in
  post 'sign_in', :to => 'sessions#sign_in_attempt', :as => :sign_in_attempt
  get 'sign_up', :to => 'sessions#sign_up', :as => :sign_up
  post 'sign_up', :to => 'sessions#sign_up_attempt', :as => :sign_up_attempt
  get 'log_out', :to => 'sessions#destroy', :as => :log_out

  get 'home', :to => 'users#index', :as => :home
  get 'profile', :to => 'users#show', :as => :profile

  get 'wigs', :to => 'wigs#index', :as => :wigs
  get 'wigs/:id', :to => 'wigs#show', :as => :show_wig
  get 'wigs/:id/posted', :to => 'wigs#posted', :as => :posted_wig
  patch 'wigs/:id', :to => 'wigs#pick', :as => :pick_wig

  resources :users, :only => [:update, :destroy] do
    resources :wigs, :except => [:index, :show]
  end

end
