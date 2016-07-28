Rails.application.routes.draw do
  resources :people
  resources :projects do
    resources :tickets
  end
  resources :purchases
  resources :peoples
 root :to => "projects#index"
end
