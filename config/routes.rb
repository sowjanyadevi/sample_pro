Rails.application.routes.draw do
  resources :projects do
    resources :tickets
  end
  resources :purchases
 root :to => "projects#index"
end
