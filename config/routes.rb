Rails.application.routes.draw do
 
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
