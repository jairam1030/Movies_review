Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :movies do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index, :edit]
  end
  root 'movies#index'
end
