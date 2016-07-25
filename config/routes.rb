Rails.application.routes.draw do
  resources :projects do
    resources :tickets
  end
  resources :users
  resources :purchases
 root :to => "projects#index"
 get "/signin", to: "sessions#new"
 post "/signin", to: "sessions#create"
end
