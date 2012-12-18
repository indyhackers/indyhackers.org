IndyhackersRails::Application.routes.draw do
  devise_for :admins

  namespace "admin" do
    resources :jobs
    resources :posts
  end

  resources :jobs do
    post "viewed", :on => :member
    get "manage", :on => :member
  end

  resources :job_post_requests, :only => [:new, :create]
  resources :posts, :only => [:index, :show]
  resource :sitemap, :only => :show
  match 'job_post_request' => 'job_post_requests#new'
  match "calendar", :to => "site#calendar"
  match "blog", :to => "posts#index"
  match "blog/:id", :to => "posts#show"

  match "why_indy", :to => "site#why_indy"
  match "holiday-social" => redirect('/holiday-social-2012/')

  match '/newsletter/subscribe' => redirect('http://eepurl.com/sMpJj')

  root :to => "site#index"
end
