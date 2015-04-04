Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :movies do
    resources :reviews, except: [:show, :index]
  end
  root 'movies#index'
end
