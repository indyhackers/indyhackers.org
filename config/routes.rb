IndyhackersRails::Application.routes.draw do
  resources :jobs

  root :to => "site#index"
end
