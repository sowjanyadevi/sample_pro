Rails.application.routes.draw do
 
  namespace :admin do
    root :to => "base#index"
   resources :customers
  end
  get 'customer/new'

  get 'customer/create'

  get 'customer/show'
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"

  resources :projects do
    resources :tickets
  end
  resources :purchases
  resources :customers

 root :to => "projects#index"
end
