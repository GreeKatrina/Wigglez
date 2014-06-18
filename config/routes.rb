Wigglez::Application.routes.draw do
  root :to => "sessions#login"

  get "signup", :to => "users#new"
  post "login", :to => "sessions#login_attempt"
  get "logout", :to => "sessions#logout"
  get "home", :to => "sessions#home"
  get "profile", :to => "sessions#profile"
  get "setting", :to => "sessions#setting"

  # GET /sign_in
  # the two below are the same

  # get 'sign-in' => 'users#new', :as => :sign_in
  # get 'sign-in', :to => 'users#new', as: => :sign_in

  # # POST /events/:event_id/comments/:comment_id/votes

  # resources :events do
  #   resources :comments, :only => [:create, :show] do
  #     resources :votes, :only => [:create]
  #   end
  # end

  # # PUT /votes/345

  # resources :votes, :only => [:update, :delete]

end
