Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public#index" 
  get "u/:username" => "public#profile", as: :profile
  resources :communities do
    resources :posts
    
  end
  post "post/vote" => "votes#create"
  resources :subscriptions 
 resources :comments, only: [:create]
end
