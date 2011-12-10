IndyhackersRails::Application.routes.draw do
  devise_for :admins

  resources :jobs do
    post "viewed", :on => :member
    get "manage", :on => :member
  end

  namespace "admin" do
    resources :jobs
  end

  resources :job_post_requests, :only => [:new, :create]
  match 'job_post_request' => 'job_post_requests#new'
  match "blog", :to => "site#blog"
  match "why_indy", :to => "site#why_indy"
  match "calendar", :to => "site#calendar"
  root :to => "site#index"
end
