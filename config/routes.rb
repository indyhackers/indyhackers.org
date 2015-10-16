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

  match '/newsletter/subscribe' => redirect('http://eepurl.com/sMpJj')
  match '/newsletter/archive' => 'newsletters#index'

  root :to => "site#index"
end
