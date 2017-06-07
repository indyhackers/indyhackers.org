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
  match "submit_event", to: "site#event"

  match "why_indy", :to => "site#why_indy"
  match "holiday-social" => redirect('/holiday-social-2016/')

  match '/newsletter/subscribe' => redirect('http://eepurl.com/sMpJj')
  match '/newsletter/archive' => 'newsletters#index'

  resources :redirects, :only => [:show], :constraints => { :id => /[a-z0-9_]+/i }, :path => "r"

  match 'code-of-conduct' => 'site#coc'
  get 'coc' => 'site#coc'

  root :to => "site#index"
end
