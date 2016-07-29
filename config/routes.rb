Rails.application.routes.draw do
 
  get 'customer/new'

  get 'customer/create'

  get 'customer/show'

  resources :projects do
    resources :tickets
  end
  resources :purchases
  resources :customers

 root :to => "projects#index"
end
