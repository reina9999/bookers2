Rails.application.routes.draw do
  devise_for :users
  get root :to => 'homes#top'
  get '/home/about' => "homes#about"
  resources :books
  resources :users

end