Rails.application.routes.draw do
  devise_for :users
  get 'movies/index'
  get 'movies/show'
  get 'movies/edit'
  get 'movies/create'
  get 'movies/search'
  get 'movies/delete'
  get 'movies/new'

  root 'movies#index'
  resources :movies do 
  resources :reviews
  collection do
    get 'search'
  end
  end 
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

 