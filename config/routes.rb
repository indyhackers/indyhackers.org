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

  match "why_indy", :to => "site#why_indy"
  match "holiday-social" => redirect('/holiday-social-2015/')

  match 'code-of-conduct' => 'site#code_of_conduct'

  match '/newsletter/subscribe' => redirect('http://eepurl.com/sMpJj')
  match '/newsletter/archive' => 'newsletters#index'

  resources :redirects, :only => [:show], :constraints => { :id => /[a-z0-9_]+/i }, :path => "r"

  root :to => "site#index"
end
