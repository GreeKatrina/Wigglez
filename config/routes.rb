Wigglez::Application.routes.draw do
  root :to => "sessions#login"
  get "signup", :to => "users#new"
  post "login", :to => "sessions#login_attempt"
  get "logout", :to => "sessions#logout"
  get "home", :to => "sessions#home"
  get "profile", :to => "sessions#profile"
  get "setting", :to => "sessions#setting"
end
