Rails.application.routes.draw do
  devise_for :admins

  namespace "admin" do
    resources :jobs do
      post :close, on: :member
    end
  end

  resources :jobs do
    post "viewed", on: :member
    get "manage", on: :member
  end

  resources :job_post_requests, only: [:new, :create]
  resource :sitemap, only: :show
  get 'about' => 'site#about'
  get 'job_post_request' => 'job_post_requests#new'
  get "calendar", to: "site#calendar"

  get 'code-of-conduct' => 'site#coc'

  get 'hackies' => 'site#hackies'

  get '/newsletter/subscribe' => redirect('http://eepurl.com/sMpJj')
  get '/newsletter' => 'newsletters#index'
  get '/newsletter/archive' => 'newsletters#index'

  resources :redirects, only: [:show], constraints: { id: /[a-z0-9_]+/i }, path: "r"

  get 'coc' => 'site#coc'

  root to: "site#index"
end
