IndyhackersRails::Application.routes.draw do
  devise_for :admins

  namespace "admin" do
    resources :jobs
  end


  resources :jobs do
    post "viewed", :on => :member
    get "manage", :on => :member
  end
  resources :job_post_requests, :only => [:new, :create]
  resource :sitemap, :only => :show
  match 'job_post_request' => 'job_post_requests#new'
  match "calendar", :to => "site#calendar"

  match "blog", :to => "site#blog"
  match "why_indy", :to => "site#why_indy"

  root :to => "site#index"
end
